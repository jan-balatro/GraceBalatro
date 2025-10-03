SMODS.Joker{ --Drain
    key = "drain",
    config = {
        extra = {
            odds = 3,
            mult = 13
        }
    },
    loc_txt = {
        ['name'] = 'Drain',
        ['text'] = {
            [1] = '{C:green}1 in 3 chance{} of giving',
            [2] = '{C:red}+13{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_7c8bd469', 1, card.ability.extra.odds, 'j_gracebal_drain', false) then
              SMODS.calculate_effect({mult = card.ability.extra.mult}, card)
          end
            end
        end
    end
}