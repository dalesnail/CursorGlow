local GLiB = _G.GLiB
if not GLiB then
    return
end

local P = GLiB._p
if not P then
    return
end

P.npcData = P.npcData or {}

local npcData = P.npcData

--[[ Flight Masters ]]
local function Flight(npcId, name, title)
    npcData[npcId] = {
        id = npcId,
        name = name,
        title = title,
        type = "flightmaster",
        kind = "npc",
        tags = {
            flightmaster = true,
            service = true,
            taxi = true,
        },
    }
end

--[[ Guards ]]
local function Guard(npcId, name, title)
    npcData[npcId] = {
        id = npcId,
        name = name,
        title = title,
        type = "directions_guard",
        kind = "npc",
        tags = {
            directions_guard = true,
            city_guard = true,
            guard = true,
            service = true,
        },
    }
end

-- ############################################################
-- Flight Masters
-- ############################################################

Flight(352, "Dungar Longdrink", "Gryphon Master")
Flight(523, "Thor", "Gryphon Master")
Flight(931, "Ariena Stormfeather", "Gryphon Master")
Flight(1387, "Thysta", "Wind Rider Master")
Flight(1571, "Shellei Brondir", "Gryphon Master")
Flight(1572, "Thorgrum Borrelson", "Gryphon Master")
Flight(1573, "Gryth Thurden", "Gryphon Master")
Flight(2226, "Karos Razok", "Bat Handler")
Flight(2299, "Borgus Stoutarm", "Gryphon Master")
Flight(2389, "Zarise", "Bat Handler")
Flight(2409, "Felicia Maline", "Gryphon Master")
Flight(2432, "Darla Harris", "Gryphon Master")
Flight(2835, "Cedrik Prose", "Gryphon Master")
Flight(2851, "Urda", "Wind Rider Master")
Flight(2858, "Gringer", "Wind Rider Master")
Flight(2859, "Gyll", "Gryphon Master")
Flight(2861, "Gorrik", "Wind Rider Master")
Flight(2941, "Lanie Reed", "Gryphon Master")
Flight(2995, "Tal", "Wind Rider Master")
Flight(3305, "Grisha", "Wind Rider Master")
Flight(3310, "Doras", "Wind Rider Master")
Flight(3575, "Praenus Raxxeus", "Bat Handler")
Flight(3615, "Devrak", "Wind Rider Master")
Flight(3838, "Vesprystus", "Hippogryph Master")
Flight(3841, "Caylais Moonfeather", "Hippogryph Master")
Flight(4267, "Daelyshia", "Hippogryph Master")
Flight(4312, "Tharm", "Wind Rider Master")
Flight(4314, "Gorkas", "Wind Rider Master")
Flight(4317, "Nyse", "Wind Rider Master")
Flight(4319, "Thyssiana", "Hippogryph Master")
Flight(4321, "Baldruc", "Gryphon Master")
Flight(4407, "Teloren", "Hippogryph Master")
Flight(4551, "Michael Garrett", "Bat Handler")
Flight(6026, "Breyk", "Wind Rider Master")
Flight(6706, "Baritanas Skyriver", "Hippogryph Master")
Flight(6726, "Thalon", "Wind Rider Master")
Flight(7823, "Bera Stonehammer", "Gryphon Master")
Flight(7824, "Bulkrek Ragefist", "Wind Rider Master")
Flight(8018, "Guthrum Thunderfist", "Gryphon Master")
Flight(8019, "Fyldren Moonfeather", "Hippogryph Master")
Flight(8020, "Shyn", "Wind Rider Master")
Flight(8609, "Alexandra Constantine", "Gryphon Master")
Flight(8610, "Kroum", "Wind Rider Master")
Flight(10378, "Omusa Thunderhorn", "Wind Rider Master")
Flight(10583, "Gryfe", "Flight Master")
Flight(10897, "Sindrayl", "Hippogryph Master")
Flight(11138, "Maethrya", "Hippogryph Master")
Flight(11139, "Yugrek", "Wind Rider Master")
Flight(11899, "Shardi", "Wind Rider Master")
Flight(11900, "Brakkar", "Wind Rider Master")
Flight(11901, "Andruk", "Wind Rider Master")
Flight(12577, "Jarrodenus", "Hippogryph Master")
Flight(12578, "Mishellena", "Hippogryph Master")
Flight(12596, "Bibilfaz Featherwhistle", "Gryphon Master")
Flight(12616, "Vhulgra", "Wind Rider Master")
Flight(12617, "Khaelyn Steelwing", "Gryphon Master")
Flight(12636, "Georgia", "Bat Handler")
Flight(12740, "Faustron", "Wind Rider Master")
Flight(13177, "Vahgruk", "Wind Rider Master")
Flight(15177, "Cloud Skydancer", "Hippogryph Master")
Flight(15178, "Runk Windtamer", "Wind Rider Master")
Flight(16189, "Skymaster Sunwing", "Dragonhawk Master")
Flight(16192, "Skymistress Gloaming", "Dragonhawk Master")
Flight(16227, "Bragok", "Flight Master")
Flight(16587, "Barley", "Wind Rider Master")
Flight(16822, "Flightmaster Krill Bitterhue", "Gryphon Master")
Flight(17554, "Laando", "Hippogryph Master")
Flight(17555, "Stephanos", "Hippogryph Master")
Flight(18785, "Kuma", "Hippogryph Master")
Flight(18788, "Munci", "Hippogryph Master")
Flight(18789, "Furgu", "Hippogryph Master")
Flight(18807, "Kerna", "Wind Rider Master")
Flight(18808, "Gursha", "Wind Rider Master")
Flight(18809, "Furnan Skysoar", "Gryphon Master")
Flight(18930, "Vlagga Freyfeather", "Wind Rider Master")
Flight(18931, "Amish Wildhammer", "Gryphon Master")
Flight(18937, "Amerun Leafshade", "Hippogryph Master")
Flight(18938, "Krexcil", "Flight Master")
Flight(18939, "Brubeck Stormfoot", "Gryphon Master")
Flight(18940, "Nutral", "Flight Master")
Flight(18942, "Innalia", "Wind Rider Master")
Flight(18953, "Unoke Tenderhoof", "Wind Rider Master")
Flight(19558, "Amilya Airheart", "Wind Rider Master")
Flight(19581, "Maddix", "Flight Master")
Flight(19583, "Grennik", "Flight Master")
Flight(20234, "Runetog Wildhammer", "Gryphon Master")
Flight(20515, "Harpax", "Flight Master")
Flight(21107, "Rip Pedalslam", "Gryphon Master")
Flight(21766, "Alieshor", "Flight Master")
Flight(22216, "Fhyn Leafshadow", "Flight Master")
Flight(22455, "Sky-Master Maxxor", "Flight Master")
Flight(22485, "Halu", "Hippogryph Master")
Flight(22935, "Suralais Farwind", "Hippogryph Master")
Flight(22937, "Noorab", "Hippogryph Master")
Flight(23612, "Dyslix Silvergrub", "Flight Master")
Flight(24366, "Nizzle", "Gryphon Master")
Flight(24851, "Kiz Coilspanner", "Flight Master")
Flight(26560, "Ohura", "Dragonhawk Master")

-- ############################################################
-- Guards
-- ############################################################

Guard(68, "Stormwind City Guard", "Stormwind City Guard")
Guard(1423, "Stormwind Guard", "Stormwind Guard")
Guard(1756, "Stormwind Royal Guard", "Stormwind Royal Guard")
Guard(3084, "Bluffwatcher", "Bluffwatcher")
Guard(3296, "Orgrimmar Grunt", "Orgrimmar Grunt")
Guard(4262, "Darnassus Sentinel", "Darnassus Sentinel")
Guard(5595, "Ironforge Guard", "Ironforge Guard")
Guard(5624, "Undercity Guardian", "Undercity Guardian")
Guard(16221, "Silvermoon Guardian", "Silvermoon Guardian")
Guard(16222, "Silvermoon City Guardian", "Silvermoon City Guardian")
Guard(16733, "Exodar Peacekeeper", "Exodar Peacekeeper")
Guard(19687, "Shattrath City Peacekeeper", "Shattrath City Peacekeeper")