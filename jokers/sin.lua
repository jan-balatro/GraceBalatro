SMODS.Joker{ --sin
    key = "sin",
    config = {
        extra = {
            emult = 2
        }
    },
    loc_txt = {
        ['name'] = 'sin',
        ['text'] = {
            [1] = 'Sets {C:attention}Joker Slots{} to 1',
            [2] = '{X:red,C:white}^2{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
                return {
                    e_mult = card.ability.extra.emult
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_joker_slots = G.jokers.config.card_limit
        G.jokers.config.card_limit = 1
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_joker_slots then
            G.jokers.config.card_limit = card.ability.extra.original_joker_slots
        end
    end
}