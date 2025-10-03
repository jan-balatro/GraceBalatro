SMODS.Joker{ --Doombringer
    key = "doombringer",
    config = {
        extra = {
            enabled = 0,
            odds = 10,
            emult = 2,
            start_dissolve = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Doombringer',
        ['text'] = {
            [1] = '{C:attention}Waits a few rounds{}',
            [2] = 'before giving {X:mult,C:white}^2{} Mult',
            [3] = 'and {C:red}self-destructing{}',
            [4] = '{s:0.7,C:inactive}(Art by KracKedCase){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
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
    pools = { ["gracebal_gracebal_jokers"] = true, ["gracebal_balagrace"] = true },

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c97b545a', 1, card.ability.extra.odds, 'j_gracebal_doombringer', false) then
              SMODS.calculate_effect({func = function()
                    card.ability.extra.enabled = 1
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Active!", colour = G.C.RED})
          end
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.enabled or 0) == 1 then
                return {
                    e_mult = card.ability.extra.emult,
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "AAAAAAAAAAAAAAAAAAAAAAAAA",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}