return {
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            -- {"hrsh7th/cmp-emoji"},
            -- {"hrsh7th/cmp-buffer"},
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip", },
            -- {"L3MON4D3/LuaSnip",
            --     dependencies = { "rafamadriz/friendly-snippets", },
            -- },
            { "hrsh7th/cmp-nvim-lua", },
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require 'luasnip'
            -- local lsp_zero = require('lsp-zero')
            -- local cmp_action = lsp_zero.cmp_action()
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    -- { name = "buffer" },
                    { name = "path" },
                    -- { name = "calc" },
                    -- { name = "emoji" },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<leader>c"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
            })
        end
    },
}
