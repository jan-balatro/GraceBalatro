SMODS.Joker{ --God
    key = "god",
    config = {
        extra = {
            mult = 1,
            jokercount = 1
        }
    },
    loc_txt = {
        ['name'] = 'God',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}^0.1{} Mult per',
            [2] = '{C:attention} Joker{} in your',
            [3] = 'possession',
            [4] = '{C:inactive}(Currently: {X:mult,C:white}^#1#{}{C:inactive} Mult){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["gracebal_gracebal_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.mult
                }
        end
        if context.other_joker  then
                return {
                    func = function()
                    card.ability.extra.mult = card.ability.extra.jokercount + (#(G.jokers and G.jokers.cards or {})) * 0.1
                    return true
                end
                }
        end
    end
}