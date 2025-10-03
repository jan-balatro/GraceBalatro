SMODS.Joker{ --Slight
    key = "slight",
    config = {
        extra = {
            xchips = 3.5
        }
    },
    loc_txt = {
        ['name'] = 'Slight',
        ['text'] = {
            [1] = 'Gives {X:chips,C:white}X3.5{} Chips unless',
            [2] = '{C:purple}played hand{} contains',
            [3] = '{C:attention}Three of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["gracebal_gracebal_jokers"] = true, ["gracebal_balagrace"] = true },

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if not (next(context.poker_hands["Three of a Kind"])) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}