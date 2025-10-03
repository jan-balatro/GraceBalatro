SMODS.Joker{ --Elkman
    key = "elkman",
    config = {
        extra = {
            Xmult = 4,
            odds = 3
        }
    },
    loc_txt = {
        ['name'] = 'Elkman',
        ['text'] = {
            [1] = '{X:red,C:white}X4{} Mult, {C:green}1 in 3 chance{}',
            [2] = 'upon {C:purple}blind entry{} to',
            [3] = '{C:red}instantly lose run{}',
            [4] = '{s:0.7,C:inactive}(Art by KracKedCase){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_72ca218d', 1, card.ability.extra.odds, 'j_gracebal_elkman', false) then
              SMODS.calculate_effect({func = function()
                
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.5,
                    func = function()
                        if G.STAGE == G.STAGES.RUN then 
                          G.STATE = G.STATES.GAME_OVER
                          G.STATE_COMPLETE = false
                        end
                    end
                }))
                
                return true
            end}, card)
          end
            end
        end
    end
}