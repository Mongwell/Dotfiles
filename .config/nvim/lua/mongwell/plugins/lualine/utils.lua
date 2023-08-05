M = {}

M.color_avg = function(c1_hex, c2_hex)
    local c1 = {
        r = tonumber(string.sub(c1_hex, 1, 2), 16),
        g = tonumber(string.sub(c1_hex, 3, 4), 16),
        b = tonumber(string.sub(c1_hex, 5, 6), 16),
    }
    local c2 = {
        r = tonumber(string.sub(c2_hex, 1, 2), 16),
        g = tonumber(string.sub(c2_hex, 3, 4), 16),
        b = tonumber(string.sub(c2_hex, 5, 6), 16),
    }
    local avg = {
        r = math.floor(math.sqrt((c1.r * c1.r + c2.r * c2.r) / 2)),
        g = math.floor(math.sqrt((c1.g * c1.g + c2.g * c2.r) / 2)),
        b = math.floor(math.sqrt((c1.b * c1.b + c2.b * c2.r) / 2)),
    }
    return string.format("%x%x%x", avg.r, avg.g, avg.b)
end

return M
