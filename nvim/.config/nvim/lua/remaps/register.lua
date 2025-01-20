map = vim.keymap.set
opt = { noremap = true, silent = true }

-- remaps so that deleting will not change yank register

map("n", "x", '"_x', opt)          -- replacing one char
map("n", "<leader>x", 'x', opt)   -- the normals is set to use with leader





map("n", "d", '"_d', opt)          -- deleting
map("v", "d", '"_d', opt)          --    |
map("x", "d", '"_d', opt)          --    |

map("n", "D", '"_D', opt)          -- delete entire line




                                                                           --       |
map("n", "<leader>d", 'd', opt)   --       |
map("v", "<leader>d", 'd', opt)   --       |
map("x", "<leader>d", 'd', opt)   --       |
                                                                           --       |
map("n", "<leader>D", 'D', opt)   --       |



                                                                           --       |


map("n", "s", '"_s', opt)
map("v", "s", '"_s', opt)
map("x", "s", '"_s', opt)


map("n", "c", '"_c', opt)          -- deleting
map("v", "c", '"_c', opt)          --    |
map("x", "c", '"_c', opt)          --    |

