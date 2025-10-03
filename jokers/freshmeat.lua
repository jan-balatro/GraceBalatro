SMODS.Joker{ --Fresh Meat
    key = "freshmeat",
    config = {
        extra = {
            echips = 1.03
        }
    },
    loc_txt = {
        ['name'] = 'Fresh Meat',
        ['text'] = {
            [1] = 'haagghh... {X:blue,C:red}^fresh meat{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["gracebal_gracebal_jokers"] = true, ["gracebal_balagrace"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_chips = card.ability.extra.echips
                }
        end
    end
}