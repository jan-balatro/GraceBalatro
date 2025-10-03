SMODS.Joker{ --Kookoo
    key = "kookoo",
    config = {
        extra = {
            Xmult = 4
        }
    },
    loc_txt = {
        ['name'] = 'Kookoo',
        ['text'] = {
            [1] = 'Gives {X:red,C:white}X4{} Mult if {C:planet}played',
            [2] = 'hand{} is {C:attention}#1#{}, changes at',
            [3] = '{C:purple}end of round{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.kookoohand_hand or 'High Card'), 'poker_hands')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.kookoohand_hand = 'Three of a Kind'
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == G.GAME.current_round.kookoohand_hand then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                local kookoohand_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        kookoohand_hands[#kookoohand_hands + 1] = handname
                    end
                end
                if kookoohand_hands[1] then
                    G.GAME.current_round.kookoohand_hand = pseudorandom_element(kookoohand_hands, pseudoseed('kookoohand' .. G.GAME.round_resets.ante))
                end
        end
    end
}