SMODS.Edition {
    key = 'pure',
    shader = 'booster',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    config = {
        exp_mult = 1.1,
        retrigger_times = 1
    },
    in_shop = false,
    weight = 2,
    extra_cost = 2,
    apply_to_float = false,
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Pure',
        label = 'Pure',
        text = {
        [1] = '{X:red,C:white}^1.1{} Mult, {C:green}retrigger {}this',
        [2] = 'card {C:attention}1{} additional time'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            card.should_retrigger = false
            card.should_retrigger = true
            card.ability.extra.retrigger_times = card.edition.retrigger_times
            SMODS.calculate_effect({e_mult = card.edition.exp_mult}, card)
        end
    end
}