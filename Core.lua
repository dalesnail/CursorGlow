-- ############################################################
-- CORE: Addon Initialization
-- ############################################################

local ADDON_NAME, ns = ...
local GG = ns.GauntletGlow

ns.CursorStateDefaults = ns.CursorStateDefaults or {
    DEFAULT = {
        sizeX = 68,
        sizeY = 65,
        offsetX = 15,
        offsetY = -13.5,
    },
    ATTACK = {
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },
    LOOT = {
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },
    AUTOLOOT = {
        sizeX = 68,
        sizeY = 68,
        offsetX = 15,
        offsetY = -15,
    },
    HERBALISM = {
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },
    MINING = {
        sizeX = 65,
        sizeY = 70,
        offsetX = 13.5,
        offsetY = -16,
    },
    FLIGHTMASTER = {
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },
    BATTLEMASTER = {
        sizeX = 69,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },
    TRAINER = {
        sizeX = 69,
        sizeY = 70,
        offsetX = 16,
        offsetY = -15.5,
    },
    SPEAK = {
        sizeX = 67,
        sizeY = 64,
        offsetX = 14.5,
        offsetY = -13,
    },
    DIRECTIONS_GUARD = {
        sizeX = 68,
        sizeY = 69,
        offsetX = 15.5,
        offsetY = -15,
    },
    INNKEEPER = {
        sizeX = 66,
        sizeY = 66,
        offsetX = 14,
        offsetY = -14,
    },
    STABLEMASTER = {
        sizeX = 69,
        sizeY = 69,
        offsetX = 15.5,
        offsetY = -15.5,
    },
    MAILBOX = {
        sizeX = 70,
        sizeY = 65,
        offsetX = 16,
        offsetY = -13.5,
    },
    BANKER = {
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },
    SKINNABLE = {
        sizeX = 69,
        sizeY = 66,
        offsetX = 16,
        offsetY = -16,
    },
    VENDOR = {
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },
    SELL_ITEM = {
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },
    REPAIR_VENDOR = {
        sizeX = 67,
        sizeY = 68,
        offsetX = 14.5,
        offsetY = -15,
    },
}

local CURSOR_STATE_PROFILE_KEYS = {
    DEFAULT = {
        sizeX = "sizeX",
        sizeY = "sizeY",
        offsetX = "offsetX",
        offsetY = "offsetY",
    },
    ATTACK = {
        sizeX = "swordSizeX",
        sizeY = "swordSizeY",
        offsetX = "swordOffsetX",
        offsetY = "swordOffsetY",
    },
    LOOT = {
        sizeX = "lootSizeX",
        sizeY = "lootSizeY",
        offsetX = "lootOffsetX",
        offsetY = "lootOffsetY",
    },
    AUTOLOOT = {
        sizeX = "autoLootSizeX",
        sizeY = "autoLootSizeY",
        offsetX = "autoLootOffsetX",
        offsetY = "autoLootOffsetY",
    },
    HERBALISM = {
        sizeX = "herbSizeX",
        sizeY = "herbSizeY",
        offsetX = "herbOffsetX",
        offsetY = "herbOffsetY",
    },
    MINING = {
        sizeX = "miningSizeX",
        sizeY = "miningSizeY",
        offsetX = "miningOffsetX",
        offsetY = "miningOffsetY",
    },
    FLIGHTMASTER = {
        sizeX = "flightMasterSizeX",
        sizeY = "flightMasterSizeY",
        offsetX = "flightMasterOffsetX",
        offsetY = "flightMasterOffsetY",
    },
    BATTLEMASTER = {
        sizeX = "battlemasterSizeX",
        sizeY = "battlemasterSizeY",
        offsetX = "battlemasterOffsetX",
        offsetY = "battlemasterOffsetY",
    },
    TRAINER = {
        sizeX = "trainerSizeX",
        sizeY = "trainerSizeY",
        offsetX = "trainerOffsetX",
        offsetY = "trainerOffsetY",
    },
    SPEAK = {
        sizeX = "speakSizeX",
        sizeY = "speakSizeY",
        offsetX = "speakOffsetX",
        offsetY = "speakOffsetY",
    },
    DIRECTIONS_GUARD = {
        sizeX = "directionsGuardSizeX",
        sizeY = "directionsGuardSizeY",
        offsetX = "directionsGuardOffsetX",
        offsetY = "directionsGuardOffsetY",
    },
    INNKEEPER = {
        sizeX = "innkeeperSizeX",
        sizeY = "innkeeperSizeY",
        offsetX = "innkeeperOffsetX",
        offsetY = "innkeeperOffsetY",
    },
    STABLEMASTER = {
        sizeX = "stableMasterSizeX",
        sizeY = "stableMasterSizeY",
        offsetX = "stableMasterOffsetX",
        offsetY = "stableMasterOffsetY",
    },
    MAILBOX = {
        sizeX = "mailboxSizeX",
        sizeY = "mailboxSizeY",
        offsetX = "mailboxOffsetX",
        offsetY = "mailboxOffsetY",
    },
    BANKER = {
        sizeX = "bankerSizeX",
        sizeY = "bankerSizeY",
        offsetX = "bankerOffsetX",
        offsetY = "bankerOffsetY",
    },
    SKINNABLE = {
        sizeX = "skinnableSizeX",
        sizeY = "skinnableSizeY",
        offsetX = "skinnableOffsetX",
        offsetY = "skinnableOffsetY",
    },
    VENDOR = {
        sizeX = "vendorSizeX",
        sizeY = "vendorSizeY",
        offsetX = "vendorOffsetX",
        offsetY = "vendorOffsetY",
    },
    SELL_ITEM = {
        sizeX = "sellItemSizeX",
        sizeY = "sellItemSizeY",
        offsetX = "sellItemOffsetX",
        offsetY = "sellItemOffsetY",
    },
    REPAIR_VENDOR = {
        sizeX = "repairVendorSizeX",
        sizeY = "repairVendorSizeY",
        offsetX = "repairVendorOffsetX",
        offsetY = "repairVendorOffsetY",
    },
}

local function CreateProfileDefaults()
    local profileDefaults = {
        enabled = true,
        testMode = false,
        useCustomColor = false,
        colorR = 1,
        colorG = 1,
        colorB = 1,
        desaturateTexture = false,
        useBrightness = false,
        brightness = 1,
        useGlobalAlpha = false,
        globalAlpha = 1,
    }

    for stateKey, profileKeys in pairs(CURSOR_STATE_PROFILE_KEYS) do
        local stateDefaults = ns.CursorStateDefaults[stateKey]
        if stateDefaults then
            profileDefaults[profileKeys.sizeX] = stateDefaults.sizeX
            profileDefaults[profileKeys.sizeY] = stateDefaults.sizeY
            profileDefaults[profileKeys.offsetX] = stateDefaults.offsetX
            profileDefaults[profileKeys.offsetY] = stateDefaults.offsetY
        end
    end

    return profileDefaults
end

GG = LibStub("AceAddon-3.0"):NewAddon(
    ADDON_NAME,
    "AceEvent-3.0",
    "AceTimer-3.0",
    "AceConsole-3.0"
)

ns.GauntletGlow = GG

local LOOT_EXPIRATION = 240
local CLEANUP_INTERVAL = 30

function GG:OnInitialize()
    _G.GauntletGlowNS = ns

    self.db = LibStub("AceDB-3.0"):New("GauntletGlowDB", {
        profile = CreateProfileDefaults()
    })

    self.lootedUnits = {}
    self.lastMouseoverGUID = nil
    self.States = ns.States
end

function GG:OnEnable()
    self:CreateGauntletGlow()
    self:StartCursorMovement()
    self:StartTriggerLoop()
    self:SetupOptions()

    self:RegisterChatCommand("gg", "OpenConfig")
    self:RegisterChatCommand("gauntletglow", "OpenConfig")

    self:RegisterEvent("LOOT_OPENED")

    self.cleanupTimer = self:ScheduleRepeatingTimer("CleanupLootedUnits", CLEANUP_INTERVAL)
end

function GG:LOOT_OPENED()
    if self.lastMouseoverGUID then
        self.lootedUnits[self.lastMouseoverGUID] = GetTime()
    end
end

function GG:CleanupLootedUnits()
    local now = GetTime()

    for guid, timestamp in pairs(self.lootedUnits) do
        if now - timestamp > LOOT_EXPIRATION then
            self.lootedUnits[guid] = nil
        end
    end
end

function GG:OnDisable()
    if self.cleanupTimer then
        self:CancelTimer(self.cleanupTimer)
        self.cleanupTimer = nil
    end
end
