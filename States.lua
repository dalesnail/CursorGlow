local ADDON_NAME, ns = ...
local GG = ns.GauntletGlow

ns.States = {

    DEFAULT = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\cursor_glow_default.png",
        sizeX = 68,
        sizeY = 65,
        offsetX = 15,
        offsetY = -13.5,
    },

    ATTACK = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\sword_glow_default.png",
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },

    LOOT = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\loot_glow.png",
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },

    AUTOLOOT = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\autoloot_glow.png",
        sizeX = 68,
        sizeY = 68,
        offsetX = 15,
        offsetY = -15,
    },

    HERBALISM = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\herb_glow.png",
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },

    MINING = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\mining_glow.png",
        sizeX = 65,
        sizeY = 70,
        offsetX = 13.5,
        offsetY = -16,
    },

    FLIGHTMASTER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\flight_glow.png",
        sizeX = 70,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },

    BATTLEMASTER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\battlemaster_glow.png",
        sizeX = 69,
        sizeY = 70,
        offsetX = 16,
        offsetY = -16,
    },

    TRAINER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\trainer_glow.png",
        sizeX = 69,
        sizeY = 70,
        offsetX = 16,
        offsetY = -15.5,
    },

    DIRECTIONS_GUARD = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\directions_glow.png",
        sizeX = 68,
        sizeY = 69,
        offsetX = 15.5,
        offsetY = -15,
    },

    INNKEEPER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\innkeeper_glow.png",
        sizeX = 66,
        sizeY = 66,
        offsetX = 14,
        offsetY = -14,
    },

    STABLEMASTER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\stablemaster_glow.png",
        sizeX = 69,
        sizeY = 69,
        offsetX = 15.5,
        offsetY = -15.5,
    },

    MAILBOX = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\mail_glow.png",
        sizeX = 70,
        sizeY = 65,
        offsetX = 16,
        offsetY = -13.5,
    },

    BANKER = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\loot_glow.png",
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },

    SKINNABLE = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\skinnable_glow.png",
        sizeX = 69,
        sizeY = 66,
        offsetX = 16,
        offsetY = -16,
    },

    VENDOR = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\loot_glow.png",
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },

    SELL_ITEM = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\loot_glow.png",
        sizeX = 64,
        sizeY = 64,
        offsetX = 13,
        offsetY = -13,
    },

    REPAIR_VENDOR = {
        texture = "Interface\\AddOns\\GauntletGlow\\Media\\repair_glow.png",
        sizeX = 67,
        sizeY = 68,
        offsetX = 14.5,
        offsetY = -15,
    },
}

-- ############################################################
-- PRIORITY SYSTEM
-- ############################################################

ns.StatePriority = {
    SELL_ITEM = 100,
    HERBALISM = 95,
    MINING = 95,
    FLIGHTMASTER = 90,
    BATTLEMASTER = 88,
    TRAINER = 87,
    DIRECTIONS_GUARD = 86,
    INNKEEPER = 84,
    STABLEMASTER = 83,
    MAILBOX = 82,
    BANKER = 81.75,
    VENDOR = 81,
    REPAIR_VENDOR = 81.5,
    AUTOLOOT = 85,
    LOOT = 80,
    SKINNABLE = 79,
    ATTACK = 70,
    DEFAULT = 0,
}
