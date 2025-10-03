SMODS.Joker{ --Doppel
    key = "doppel",
    config = {
        extra = {
            xchips = 2,
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Doppel',
        ['text'] = {
            [1] = '{X:blue,C:white}X2{} Chips and {X:red,C:white}X2{} Mult on',
            [2] = '{C:attention}final hand{} of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
            if G.GAME.current_round.hands_left == 0 then
                return {
                    x_chips = card.ability.extra.xchips,
                    extra = {
                        Xmult = card.ability.extra.Xmult
                        }
                }
            end
        end
    end
}