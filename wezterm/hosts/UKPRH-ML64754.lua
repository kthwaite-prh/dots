local M = {}
local wezterm = require("wezterm")

M.setup = function(config)
    config.color_scheme = "Kanagawa (Gogh)"
    config.audible_bell = "Disabled"
    config.send_composed_key_when_left_alt_is_pressed = true
    return config
end

return M
