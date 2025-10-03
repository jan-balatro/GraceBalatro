SMODS.Joker{ --Litany
    key = "litany",
    config = {
        extra = {
            round = 0,
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Litany',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult every {C:attention}third{}',
            [2] = 'round',
            [3] = '{C:inactive}(Currently #1#/3){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    pools = { ["gracebal_mycustom_jokers"] = true, ["gracebal_balagrace"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.round}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.round = (card.ability.extra.round) + 1
                    return true
                end,
                    message = "+1 Round"
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.round or 0) == 3 then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if (card.ability.extra.round or 0) == 3 then
                return {
                    func = function()
                    card.ability.extra.round = 0
                    return true
                end,
                    message = "Reset"
                }
            end
        end
    end
}