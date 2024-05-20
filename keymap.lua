local Keys = {}

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Ref: https://github.com/slydragonn/dotfiles/blob/main/.config/nvim/lua/slydragonn/maps.lua

function Keys.nerdtree()
	map("n", "ff", "<CMD>NERDTreeToggle<CR>")
end

function Keys.neoformat()
	map("n", "<F7>", "<CMD>Neoformat<CR>")
end

function Keys.leaderf()
	map("n", "<C-p>", "<CMD>Leaderf file<CR>")
	map("n", "<C-i>", "<CMD>Leaderf mru<CR>")
	map("n", "<C-e>", "<CMD>Leaderf mru<CR>")
	map("n", "<C-f>", "<CMD>Leaderf function<CR>")
	map("n", "<F2>", "<CMD>Leaderf filetype<CR>")
end

function Keys.nerdcommenter()
	map("n", "ci", "<Plug>NERDCommenterInvert<CR>")
	map("v", "ci", "<Plug>NERDCommenterInvert")
end

function Keys.ctrlsf()
	map("n", "<Leader>f", "<CMD>CtrlSF <C-R><C-W><CR>")
end

function Keys.tagbar()
	map("n", "tt", "<CMD>TagbarToggle<CR>")
end

return Keys
