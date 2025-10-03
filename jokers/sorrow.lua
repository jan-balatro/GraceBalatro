SMODS.Joker{ --Sorrow
    key = "sorrow",
    config = {
        extra = {
            mult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Sorrow',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult, decreases by',
            [2] = '{X:mult,C:white}X0.1{} on discard'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["gracebal_gracebal_jokers"] = true, ["gracebal_balagrace"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.mult
                }
        end
        if context.pre_discard  then
                return {
                    func = function()
                    card.ability.extra.mult = math.max(0, (card.ability.extra.mult) - 0.1)
                    return true
                end
                }
        end
    end
}