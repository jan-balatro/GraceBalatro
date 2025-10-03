SMODS.Joker{ --Ire
    key = "ire",
    config = {
        extra = {
            Xmult = 2,
            odds = 13,
            start_dissolve = 0,
            n = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ire',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult, {C:green}1 in 13 chance{}',
            [2] = 'of {C:red}self-destructing{} on',
            [3] = '{C:red}discard{}, creates {C:attention}Rue{}',
            [4] = 'when destroyed or sold'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
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
        if context.pre_discard  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d75b110c', 1, card.ability.extra.odds, 'j_gracebal_ire', false) then
              SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        SMODS.calculate_effect({func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_gracebal_rue' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
          end
            end
        end
        if context.selling_self  then
                return {
                    func = function()
            local created_joker = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_gracebal_rue' })
                    if joker_card then
                        
                        
                    end
                    
                    return true
                end
            }))
            
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}