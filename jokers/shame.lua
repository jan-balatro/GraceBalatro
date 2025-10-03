SMODS.Joker{ --Shame
    key = "shame",
    config = {
        extra = {
            currentante = 0
        }
    },
    loc_txt = {
        ['name'] = 'Shame',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}XMult{} equal to',
            [2] = 'half the current {C:attention}Ante{}',
            [3] = '{C:inactive}(Currently: {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        return {vars = {((G.GAME.round_resets.ante or 0)) * 0.5}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = (G.GAME.round_resets.ante) * 0.5
                }
        end
    end
}