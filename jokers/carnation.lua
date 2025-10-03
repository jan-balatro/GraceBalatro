SMODS.Joker{ --Carnation
    key = "carnation",
    config = {
        extra = {
            mult = 0,
            handsplayedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Carnation',
        ['text'] = {
            [1] = '{C:red}+2{} Mult per consecutive',
            [2] = 'Blind beaten in one hand',
            [3] = '{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult){}{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
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
    pools = { ["gracebal_mycustom_jokers"] = true, ["gracebal_balagrace"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    mult = card.ability.extra.mult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            if G.GAME.current_round.hands_played == 1 then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 2
                    return true
                end,
                    message = "+2 Mult"
                }
            elseif G.GAME.current_round.hands_played > 1 then
                return {
                    func = function()
                    card.ability.extra.mult = 0
                    return true
                end,
                    message = "Reset"
                }
            end
        end
    end
}