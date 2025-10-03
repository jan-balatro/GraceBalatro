SMODS.Consumable {
    key = 'body',
    set = 'gift',
    pos = { x = 0, y = 0 },
    config = { extra = {
        dollars_value = 25,
        hand_size_value = 1
    } },
    loc_txt = {
        name = 'Body',
        text = {
        [1] = '{C:money}+25${}, {C:red}-1{} hand size'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    atlas = 'CustomConsumables',
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(25).." $", colour = G.C.MONEY})
                    ease_dollars(25, true)
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Size", colour = G.C.RED})
                    G.hand:change_size(-1)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}