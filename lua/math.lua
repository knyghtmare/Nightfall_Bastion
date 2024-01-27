function wesnoth.wml_actions.gold_min(cfg)
    -- increase gold amount by amount or set to minimum
    local gm_amount = tonumber(cfg.amount) or wml.error "[gold_min] missing required amount= attribute."

    local gm_min = tonumber(cfg.min) or gm_amount

    local sides = wesnoth.sides.find(cfg)
    
    for index, team in ipairs(sides) do
        team.gold = team.gold + gm_amount
        if team.gold < gm_min then team.gold = gm_min end
    end
end