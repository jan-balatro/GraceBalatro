SMODS.Joker{ --Heed
    key = "heed",
    config = {
        extra = {
            Xmult = 3.5
        }
    },
    loc_txt = {
        ['name'] = 'Heed',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X3.5{} Mult if',
            [2] = '{C:purple}played hand{} is {C:red}exactly{}',
            [3] = '{C:attention}Three of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
            if next(context.poker_hands["Three of a Kind"]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}