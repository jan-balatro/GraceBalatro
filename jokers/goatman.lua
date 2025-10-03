SMODS.Joker{ --Goatman
    key = "goatman",
    config = {
        extra = {
            hands = 1,
            Xmult = 4,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Goatman',
        ['text'] = {
            [1] = 'Sets {C:blue}hands {}to {C:red}1{},',
            [2] = '{X:red,C:white}X4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(card.ability.extra.hands).." Hands", colour = G.C.BLUE})
                G.GAME.current_round.hands_left = card.ability.extra.hands
                return true
            end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
    end
}