nvim/
├─ init.lua                -- 入口文件：加载所有模块，仅做「引路人」
├─ lua/                    -- 核心配置目录（Neovim 可直接 require 此目录下文件）
│  ├─ core/                -- 基础核心设置（无插件依赖）
│  │  ├─ options.lua       -- 全局选项：行号、缩进、编码等（set 相关配置）
│  │  ├─ keymaps.lua       -- 基础键位：全局通用映射（如保存、退出、分屏）
│  │  └─ autocmds.lua      -- 自动命令：如文件类型检测、保存自动格式化
│  ├─ plugins/             -- 插件相关配置
│  │  ├─ init.lua          -- 插件管理器：加载 lazy.nvim/packer（仅负责「安装插件」）
│  │  ├─ lsp.lua           -- LSP 配置：lspconfig、自动补全（如 nvim-cmp）
│  │  ├─ ui.lua            -- 界面插件：主题（如 tokyonight）、状态栏（如 lualine）
│  │  └─ editor.lua        -- 编辑插件：望远镜（telescope）、文件树（nvim-tree）等
│  └─ utils/               -- 自定义工具函数（可复用代码）
│     └─ init.lua          -- 如路径处理、快捷键封装等（供其他模块 require 调用）
└─ after/                  -- 延迟加载目录（文件类型相关配置，优先级低）
   └─ ftplugin/            -- 按文件类型配置：如 markdown.lua、lua.lua
      └─ lua.lua           -- 仅 Lua 文件生效的配置（如特定缩进、键位）

