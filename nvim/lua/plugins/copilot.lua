local copilot_lua_env = os.getenv("K6E_COPILOT_LUA")
local use_copilot_lua = copilot_lua_env ~= nil and copilot_lua_env == "1"
return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
		enabled = not use_copilot_lua,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = use_copilot_lua,
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = false,
						next = "<C-]>",
						prev = "<C-[>",
					},
				},
			})
			vim.keymap.set("i", "<Tab>", function()
				if require("copilot.suggestion").is_visible() then
					require("copilot.suggestion").accept()
				else
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, { desc = "Copilot accept suggestion / Tab" })
		end,
	},
}
