SMODS.Consumable {
    key = 'sisi',
    set = 'gift',
    pos = { x = 5, y = 0 },
    config = { extra = {
        discards_value = 1,
        dollars_value = 0
    } },
    loc_txt = {
        name = 'SiSi',
        text = {
        [1] = '{C:red}+1{} discard, sets money to',
        [2] = '{C:red}0${}'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Discard", colour = G.C.ORANGE})
                    
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
        
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    local current_dollars = G.GAME.dollars
                    local target_dollars = 0
                    local difference = target_dollars - current_dollars
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Set to $"..tostring(0), colour = G.C.MONEY})
                    ease_dollars(difference, true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}