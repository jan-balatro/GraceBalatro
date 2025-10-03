SMODS.Joker{ --Rue
    key = "rue",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Rue',
        ['text'] = {
            [1] = 'Balances {C:blue}Chips{} and {C:red}Mult{}',
            [2] = '{C:green}half of the time{}',
            [3] = '{s:0.7,C:inactive}(Art by KracKedCase){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_c0339dbe', 1, card.ability.extra.odds, 'j_gracebal_rue', false) then
              SMODS.calculate_effect({balance = true}, card)
          end
            end
        end
    end
}