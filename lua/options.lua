local options = {
    number = true;
    cursorline = true;
    shiftwidth = 4;
    expandtab = true;
    termguicolors = true,
    history = 1024;
    showcmd = true;
    showmatch = true;
    showfulltag = true;
    ruler = true;
    autoread = true;
    hlsearch = true;
    ignorecase = true;         -- ignore case in search patterns
    cmdheight = 1;
    encoding = "utf-8";
    fileencodings = "utf-8";
    clipboard = "unnamedplus"; -- allows neovim to access the system clipboard
    laststatus=3; -- 全局状态栏(NeoVim0.7)
    mouse = "a",               -- allow the mouse to be used in neovim
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end
