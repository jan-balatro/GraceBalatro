SMODS.Joker{ --Dozer
    key = "dozer",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dozer',
        ['text'] = {
            [1] = 'Adds a {C:dark_edition}Polychrome{} card',
            [2] = 'to deck when {C:purple}any booster',
            [3] = 'pack{} is {C:attention}skipped{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
        if context.skipping_booster  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_edition("e_polychrome", true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Added Card!"
                }
        end
    end
}