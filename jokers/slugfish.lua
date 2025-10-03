SMODS.Joker{ --Slugfish
    key = "slugfish",
    config = {
        extra = {
            mod_probability = 2,
            dollars = 4,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Slugfish',
        ['text'] = {
            [1] = 'All {C:green}probabilities {}are',
            [2] = '{C:red}cut in half{}, earn {C:attention}4${} when',
            [3] = 'a {C:attention}Blind {}is {C:purple}skipped{}',
            [4] = '{s:0.7,C:inactive}(Art by KracKedCase){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  denominator = denominator * card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
        if context.skip_blind  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}