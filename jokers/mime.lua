SMODS.Joker{ --Mime
    key = "mime",
    config = {
        extra = {
            repeats = 2,
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Mime',
        ['text'] = {
            [1] = 'Gives {C:red}+1{} Mult {C:attention}#1#{} times,',
            [2] = 'increases by {C:attention}2 {}at {C:purple}end of',
            [3] = 'round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.repeats}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                for i = 1, card.ability.extra.repeats do
              SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
          end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.repeats = (card.ability.extra.repeats) + 2
                    return true
                end
                }
        end
    end
}