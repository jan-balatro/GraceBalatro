SMODS.Joker{ --TEH EPIK DUCK
    key = "tehepikduck",
    config = {
        extra = {
            illusion = 1337,
            repetitions = 169
        }
    },
    loc_txt = {
        ['name'] = 'TEH EPIK DUCK',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} MUTL'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
        return {vars = {card.ability.extra.illusion}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                card.ability.extra.illusion = 1.337
                return {
                    Xmult = card.ability.extra.illusion
                ,
                    func = function()
                        for i = 1, card.ability.extra.repetitions do
              card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "QUACK", colour = G.C.ORANGE})
          end
                        return true
                    end
                }
            end
        end
    end
}