SMODS.Joker{ --PIHSROW
    key = "pihsrow",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'PIHSROW',
        ['text'] = {
            [1] = '{C:red}youcan\'tescape{}',
            [2] = '{C:red}youcan\'tescape{}',
            [3] = '{C:red}youcan\'tescape{}',
            [4] = '{C:red}youcan\'tescape{}',
            [5] = '{C:red}youcan\'tescape{}',
            [6] = '{C:red}youcan\'tescape{}',
            [7] = '{C:red}youcan\'tescape{}',
            [8] = '{C:red}youcan\'tescape{}',
            [9] = '{C:red}youcan\'tescape{}',
            [10] = '{C:red}youcan\'tescape{}',
            [11] = '{C:red}youcan\'tescape{}',
            [12] = '{C:red}youcan\'tescape{}',
            [13] = '{C:red}youcan\'tescape{}',
            [14] = '{C:red}youcan\'tescape{}',
            [15] = '{C:red}youcan\'tescape{}',
            [16] = '{C:red}youcan\'tescape{}',
            [17] = '{C:red}youcan\'tescape{}',
            [18] = '{C:red}youcan\'tescape{}',
            [19] = '{C:red}youcan\'tescape{}',
            [20] = '{C:red}youcan\'tescape{}',
            [21] = '{C:red}youcan\'tescape{}',
            [22] = '{C:red}youcan\'tescape{}',
            [23] = '{C:red}youcan\'tescape{}',
            [24] = '{C:red}youcan\'tescape{}',
            [25] = '{C:red}youcan\'tescape{}',
            [26] = '{C:red}youcan\'tescape{}',
            [27] = '{C:red}youcan\'tescape{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
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
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    func = function()
                
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
            end
                }
        end
    end
}