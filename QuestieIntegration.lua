local ADDON_NAME, ns = ...

local QuestieIntegration = ns.QuestieIntegration or {}
ns.QuestieIntegration = QuestieIntegration

local CreateFrame = CreateFrame
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local IsAddOnLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded) or IsAddOnLoaded
local pcall = pcall
local rawget = rawget
local strsplit = strsplit
local tonumber = tonumber
local type = type

local questieState = {
    ready = false,
    readyCallbackRegistered = false,
    tooltipModule = nil,
}

local function ResetQuestieState()
    questieState.ready = false
    questieState.readyCallbackRegistered = false
    questieState.tooltipModule = nil
end

local function IsQuestieLoaded()
    return type(IsAddOnLoaded) == "function" and IsAddOnLoaded("Questie") and true or false
end

local questieEventFrame = CreateFrame("Frame")
questieEventFrame:RegisterEvent("ADDON_LOADED")
questieEventFrame:SetScript("OnEvent", function(_, _, addonName)
    if addonName == "Questie" then
        ResetQuestieState()
    end
end)

local function RefreshQuestieReadyState()
    -- Gate all Questie reads on the documented public readiness API.
    if not IsQuestieLoaded() then
        ResetQuestieState()
        return false
    end

    local questie = _G.Questie
    local api = questie and questie.API

    if type(api) == "table" and api.isReady == true then
        questieState.ready = true
        return true
    end

    questieState.ready = false

    if type(api) == "table" and (not questieState.readyCallbackRegistered) and type(api.RegisterOnReady) == "function" then
        local ok = pcall(api.RegisterOnReady, function()
            questieState.ready = true
            questieState.tooltipModule = nil
        end)

        if ok then
            questieState.readyCallbackRegistered = true
        end
    end

    return false
end

local function GetTooltipModule()
    -- Questie does not currently expose a public NPC quest-state lookup, so we
    -- isolate the internal tooltip-module fallback here after readiness is confirmed.
    if type(questieState.tooltipModule) == "table" then
        return questieState.tooltipModule
    end

    local loader = _G.QuestieLoader
    if type(loader) ~= "table" then
        return nil
    end

    local modules = rawget(loader, "_modules")
    local module = type(modules) == "table" and modules.QuestieTooltips or nil
    if type(module) == "table" then
        questieState.tooltipModule = module
        return module
    end

    if type(loader.ImportModule) ~= "function" then
        return nil
    end

    local ok, module = pcall(function()
        return loader:ImportModule("QuestieTooltips")
    end)

    if ok and type(module) == "table" then
        questieState.tooltipModule = module
        return module
    end

    return nil
end

local function GetMouseoverNpcId()
    if not UnitExists("mouseover") then
        return nil
    end

    local guid = UnitGUID("mouseover")
    if not guid then
        return nil
    end

    local unitType, _, _, _, _, npcId = strsplit("-", guid)
    if unitType ~= "Creature" and unitType ~= "Vehicle" then
        return nil
    end

    return tonumber(npcId)
end

local function GetPublicObjectiveIconHint(guid)
    local questie = _G.Questie
    local api = questie and questie.API
    local getter = api and api.GetQuestObjectiveIconForUnit

    if type(guid) ~= "string" or type(getter) ~= "function" then
        return false, false
    end

    local ok, icon = pcall(getter, guid)
    if not ok then
        return false, false
    end

    return type(icon) == "string" and icon ~= "", true
end

local function IsIncompleteQuestNpcObjective(tooltip, shouldUsePublicHint, hasPublicObjectiveIcon)
    if type(tooltip) ~= "table" or type(tooltip.questId) ~= "number" then
        return false
    end

    local objective = tooltip.objective
    if type(objective) ~= "table" or type(objective.Update) ~= "function" then
        return false
    end

    local ok = pcall(function()
        objective:Update()
    end)
    if not ok or objective.Completed then
        return false
    end

    local questie = _G.Questie
    if type(questie) ~= "table" then
        return false
    end

    local iconType = objective.Icon
    -- Questie's public unit-icon API does not surface the gray question-mark
    -- incomplete marker, so we keep this internal tooltip fallback isolated here.
    if iconType == questie.ICON_TYPE_INCOMPLETE then
        return true
    end

    if shouldUsePublicHint and not hasPublicObjectiveIcon then
        return false
    end

    return iconType == questie.ICON_TYPE_TALK
        or iconType == questie.ICON_TYPE_INTERACT
end

local function ResolveTooltipState(tooltipEntries, shouldUsePublicHint, hasPublicObjectiveIcon)
    local hasQuestAvailable = false
    local hasQuestIncomplete = false

    for _, tooltip in pairs(tooltipEntries) do
        if type(tooltip) == "table" and type(tooltip.questId) == "number" then
            if tooltip.type == "Finisher" then
                return "QUEST_TURN_IN"
            end

            if tooltip.type == "NPC" then
                hasQuestAvailable = true
            end

            if not hasQuestAvailable and IsIncompleteQuestNpcObjective(tooltip, shouldUsePublicHint, hasPublicObjectiveIcon) then
                hasQuestIncomplete = true
            end
        end
    end

    if hasQuestAvailable then
        return "QUEST_AVAILABLE"
    end

    if hasQuestIncomplete then
        return "QUEST_INCOMPLETE"
    end

    return nil
end

function QuestieIntegration.GetMouseoverNpcQuestState()
    if not RefreshQuestieReadyState() then
        return nil
    end

    local npcId = GetMouseoverNpcId()
    if not npcId then
        return nil
    end

    local guid = UnitGUID("mouseover")
    local hasPublicObjectiveIcon, shouldUsePublicHint = GetPublicObjectiveIconHint(guid)

    local tooltipModule = GetTooltipModule()
    local lookupByKey = tooltipModule and type(tooltipModule.lookupByKey) == "table" and tooltipModule.lookupByKey or nil
    local tooltipEntries = lookupByKey and lookupByKey["m_" .. npcId]

    if type(tooltipEntries) ~= "table" then
        return nil
    end

    return ResolveTooltipState(tooltipEntries, shouldUsePublicHint, hasPublicObjectiveIcon)
end
