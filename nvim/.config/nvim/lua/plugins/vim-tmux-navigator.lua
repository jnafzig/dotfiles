return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<S-Left>", ":TmuxNavigateLeft<cr>" },
    { "<S-Down>", ":TmuxNavigateDown<cr>" },
    { "<S-Up>", ":TmuxNavigateUp<cr>" },
    { "<S-Right>", ":TmuxNavigateRight<cr>" },
  },
}
