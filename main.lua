SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end

local function load_editions_folder()
    local mod_path = SMODS.current_mod.path
    local editions_path = mod_path .. "/editions"
    local files = NFS.getDirectoryItemsInfo(editions_path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("editions/" .. file_name))()
        end
    end
end

local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
load_jokers_folder()
load_consumables_folder()
load_editions_folder()
SMODS.ObjectType({
    key = "gracebal_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "gracebal_mycustom_jokers",
    cards = {
        ["j_gracebal_carnation"] = true,
        ["j_gracebal_litany"] = true
    },
})

SMODS.ObjectType({
    key = "gracebal_balagrace",
    cards = {
        ["j_gracebal_carnation"] = true,
        ["j_gracebal_doombringer"] = true,
        ["j_gracebal_doppel"] = true,
        ["j_gracebal_dozer"] = true,
        ["j_gracebal_drain"] = true,
        ["j_gracebal_elkman"] = true,
        ["j_gracebal_freshmeat"] = true,
        ["j_gracebal_goatman"] = true,
        ["j_gracebal_heed"] = true,
        ["j_gracebal_ire"] = true,
        ["j_gracebal_kookoo"] = true,
        ["j_gracebal_litany"] = true,
        ["j_gracebal_mime"] = true,
        ["j_gracebal_rue"] = true,
        ["j_gracebal_shame"] = true,
        ["j_gracebal_sin"] = true,
        ["j_gracebal_slight"] = true,
        ["j_gracebal_slugfish"] = true,
        ["j_gracebal_sorrow"] = true,
        ["j_gracebal_tehepikduck"] = true
    },
})

SMODS.ObjectType({
    key = "gracebal_gracebal_jokers",
    cards = {
        ["j_gracebal_doombringer"] = true,
        ["j_gracebal_doppel"] = true,
        ["j_gracebal_dozer"] = true,
        ["j_gracebal_drain"] = true,
        ["j_gracebal_elkman"] = true,
        ["j_gracebal_freshmeat"] = true,
        ["j_gracebal_goatman"] = true,
        ["j_gracebal_god"] = true,
        ["j_gracebal_heed"] = true,
        ["j_gracebal_ire"] = true,
        ["j_gracebal_kookoo"] = true,
        ["j_gracebal_mime"] = true,
        ["j_gracebal_pihsrow"] = true,
        ["j_gracebal_rue"] = true,
        ["j_gracebal_shame"] = true,
        ["j_gracebal_sin"] = true,
        ["j_gracebal_slight"] = true,
        ["j_gracebal_slugfish"] = true,
        ["j_gracebal_sorrow"] = true,
        ["j_gracebal_tehepikduck"] = true
    },
})