-- Autocreated from the .md file

function SS()
	return require("smart-splits")
end
function TS()
	return require("telescope.builtin")
end
function UU()
	return require("user.utils")
end
function FmtAndSave()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	if #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0 then
		vim.lsp.buf.format({ async = true })
	end
	vim.cmd("update")
end

local maps = {
	n = {
		-- " folds
		["<C-i>"] = { "zR", desc = "Fold open" },
		["<BS>"] = { "za", desc = "Toggle fold" },
		-- <C-i> is ident with <TAB>
		["<S-Tab>"] = { "zM", desc = "Close ALL Folds" },
		-- Close just a split or a tab
		[",c"] = { ":bd<CR>", desc = "Close :bd" },
		-- https://github.com/axiros/vpe
		[",g"] = { ":silent call PyEvalSelection('SmartGoto', '')<CR>", desc = "[Open file or URL][vpe_goto]" },
		[",q"] = { ":quitall!<CR>", desc = "Quit all!" },
		[",u"] = { ":UndotreeToggle<CR>", desc = "Undo Tree" },
		-- 🟥 does not repeat last f t F T
		[";"] = {
			function()
				TS().buffers()
			end,
			desc = "Buffers open",
		},
		-- C-o jump older -> alt-o is jump newer (since C-i is tab which we need elsewhere)
		["<M-o>"] = { "<C-i>", desc = "Jump newer (after C-o)" },
		-- Close window
		["<M-w>"] = { ":bd!<CR>", desc = "Buffer delete :bd!" },
		["<leader>fg"] = {
			function()
				TS().git_files()
			end,
			desc = "Git files",
		},
		-- in your open buffers (toggle back and forth) :b# ⏎ " previous buffer
		["<leader><enter>"] = { ":ls<CR>:b#<CR><Space>", desc = "Previous edited buffer" },
		-- Move stuff you want to keep below a `begin_ archive` comment and G jumps to that
		["G"] = { ":$<CR><bar>:silent! ?begin_archive<CR>", desc = "End of file" },
		-- You can open many files at once, by selecting them with TAB in the picker
		["ff"] = {
			function()
				TS().find_files()
			end,
			desc = "Open file(from vi start dir)",
		},
		-- 🟥 gw reformat via gq
		["gw"] = {
			function()
				TS().live_grep()
			end,
			desc = "Live grep words",
		},
		["<leader>ql"] = { ":SessionManager! load_last_session<CR>", desc = "Session load last" },
		["<leader>qs"] = { ":SessionManager! save_current_session<CR>", desc = "Session save current" },
		["<leader>qd"] = { ":SessionManager! delete_session<CR>", desc = "Session delete" },
		["<leader>qf"] = { ":SessionManager! load_session<CR>", desc = "Session load" },
		["<leader>q."] = { ":SessionManager! load_current_dir_session<CR>", desc = "Session load session or dir" },
		[",d"] = { ":wq!<CR>", desc = "Done - write quit" },
		-- See [here][autosave]  (Poccos' version is not respecting disable opt)
		[",s"] = { ":ASToggle<CR>", desc = "Toggle Autosave all buffers" },
		[",w"] = {
			function()
				FmtAndSave()
			end,
			desc = "Format And Save",
		},
		["<C-s>"] = { "w!", desc = "Save File" },
		["<Down>"] = {
			function()
				SS().resize_down(2)
			end,
			desc = "Resize split down",
		},
		["<Left>"] = {
			function()
				SS().resize_left(2)
			end,
			desc = "Resize split left",
		},
		["<Right>"] = {
			function()
				SS().resize_right(2)
			end,
			desc = "Resize split right",
		},
		["<Up>"] = {
			function()
				SS().resize_up(2)
			end,
			desc = "Resize split up",
		},
		-- In visual or normal mode, delete w/o overwriting your "pasteable content"
		["<leader>d"] = { '"_d', desc = "Delete noregister" },
		["<M-s>"] = { ":%s//gI<Left><Left><Left>", desc = "Easy global replace" },
		["Y"] = { "y$", desc = "Yank (like C and D)" },
		-- Line join better, position cursor at join point : " (J is para down)
		["fj"] = { "$mx<cmd>join<CR>0$[`dmx h", desc = "Line join" },
		["ga"] = { ":Tabularize/" },
		-- null-ls messes formatexpr for some reason, which [affects `gq`][gqbugorfeat]
		["gq"] = { "gwgw", desc = "Format w/o formatexpr" },
		-- 🟥 The number 11 as count will work
		["11"] = { "^", desc = "First no empty char in line" },
		["<M-j>"] = { "<C-W><C-h>", desc = "Jump Left Split" },
		["<M-k>"] = { "<C-W><C-l>", desc = "Jump Right Split" },
		-- 🟥 J won't line-join. fj for that
		["J"] = { "}j", desc = "Jump paragraph down" },
		["K"] = { "{k{kk}j", desc = "Jump paragraph up" },
		[",D"] = {
			function()
				TS().diagnostics({ bufnr = 0 })
			end,
			desc = "Buffer Diagnostics",
		},
		-- gr as well but in hover
		["<leader>cR"] = {
			function()
				vim.lsp.buf.references()
			end,
			desc = "Find References",
		},
		[",1"] = { ":source ~/.config/nvim/init.lua<CR>", desc = "Reload init.lua" },
		[",2"] = { ":edit ~/.config/nvim/lua/user/init.lua<CR>", desc = "Edit init.lua" },
		[",3"] = {
			function()
				require("lazyvim.util").float_term()
			end,
			desc = "Term in dir of buf",
		},
		[",C"] = {
			function()
				TS().colorscheme({ enable_preview = true })
			end,
			desc = "Color Schemes",
		},
		[",E"] = { ":EvalInto<CR>", desc = "Vim Eval Into" },
		[",G"] = { ":TermExec cmd=lazygit<CR>", desc = "Lazygit" },
		[",W"] = { ":wa<CR>", desc = "Save all buffers" },
		-- https://github.com/axiros/vpe
		[",r"] = { ":call PyEvalSelection('Eval', '')<CR>", desc = "[VimPythonEval][vpe]" },
		["<C-L>"] = { "<C-W><C-J>" },
		["<M-H>"] = { ":edit ~/.config/nvim/lua/user/README.md<CR>", desc = "pds help" },
	},
	x = {
		[",g"] = {
			":<C-U> silent call PyEvalSelection('SmartGoto', visualmode())<CR>",
			desc = "[Open file or URL][vpe_goto]",
		},
		["ga"] = { ":Tabularize/" },
		[",E"] = { ":EvalInto<CR>", desc = "Vim Eval Into" },
		[",r"] = { ":<C-U> call PyEvalSelection('Eval', visualmode())<CR>", desc = "VimPythonEval" },
	},
	v = {
		["<leader>d"] = { '"_d', desc = "Delete noregister" },
		["gq"] = { "gwgw", desc = "Format w/o formatexpr" },
		["⏎"] = { "zO", desc = "Fold all open" },
	},
	i = {
		["<M-j>"] = { "<ESC><C-W><C-W>", desc = "Jump Left Split" },
		["<M-k>"] = { "<ESC><C-W><C-W>", desc = "Jump Right Split" },
		-- " Jump to end of line in insert mode
		["<C-E>"] = { "<C-O>A" },
	},
}

for mode, defs in pairs(maps) do
	for k, v in pairs(defs) do
		vim.keymap.set(mode, k, v[1], { desc = v["desc"] })
	end
end
