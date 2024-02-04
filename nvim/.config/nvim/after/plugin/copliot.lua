require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[",
      jump_next = "]",
      accept = "<CR>",
      refresh = "r",
      open = "<A-CR>"
    },
    layout = {
      position = "right",
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 50,
    keymap = {
      accept = "<C-CR>",
      accept_word = false,
      accept_line = false,
      next = "<A-]>",
      prev = "<A-[>",
      dismiss = "<C-c>",
    },
  },
})
