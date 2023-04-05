
-- setup dictionary for autocomplete
local dict = require("cmp_dictionary")

dict.setup({
    max_items = -1,
    first_case_insensitive = true,
    capacity = 5,
    sqlite = false,
    async = true,
})

dict.switcher({ 
    spelllang = {
        en = vim.fn.stdpath("config") .. "/en.dict",
    },
})

vim.cmd.set('spelllang=en')
