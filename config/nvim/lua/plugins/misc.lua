return {
    {
        "lambdalisue/vim-suda",
        config = function ()
            vim.g['suda#prompt'] = "Suda: Password: "
            vim.g['suda_smart_edit'] = "1"
        end
    },
    {
        "pysan3/fcitx5.nvim",
        cond = vim.fn.executable('fcitx5-remote') == 1,
        opts = {
            remember_prior = true,
            define_autocmd = true,
            autostart_fcitx5 = false
        }
    },
    {
        "teamtype/teamtype-nvim",
        lazy = false
    }
}
