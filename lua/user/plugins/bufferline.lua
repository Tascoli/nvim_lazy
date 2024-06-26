-- Autor: Tadeu Ascoli
-- Country: Brazil
-- e-mail: tascoli@gmail.com

return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                -- TODO:  - Review advanced config
                    options = {
                        mode = "buffers", -- set to "tabs" to only show tabpages instead
                        numbers = "none", --| "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
                        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
                        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
                        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
                        indicator = {
                            icon = '▎', -- this should be omitted if indicator style is not 'icon'
                            style = 'icon', -- can be: 'underline' | 'none',
                        },

                    buffer_close_icon = '✘',
                    modified_icon = '●',
                      close_icon = '✘',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    --- name_formatter can be used to change the buffer's label in the bufferline.
                    --- Please note some names can/will break the
                    --- bufferline so use this at your discretion knowing that it has
                    --- some limitations that will *NOT* be fixed.
                    name_formatter = function(buf)  -- buf contains:
                            -- name                | str        | the basename of the active file
                            -- path                | str        | the full path of the active file
                            -- bufnr (buffer only) | int        | the number of the active buffer
                            -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
                            -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
                    end,
                    max_name_length = 18,
                    max_prefix_length = 15,     -- prefix used when a buffer is de-duplicated
                    truncate_names = true,-- whether or not tab names should be truncated
                    tab_size = 18,
                },
            })
        end,
    },
}
