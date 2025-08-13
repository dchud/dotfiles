return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 30,
    },
    close_if_last_window = true,
    -- from https://github.com/LazyVim/LazyVim/discussions/1454#discussioncomment-9492368
    -- but doesn't seem to work :((
    filesystem = {
      commands = {
        -- If item is a file it will close neotree after opening it.
        open_and_close_neotree = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)

          local tree = state.tree
          local success, node = pcall(tree.get_node, tree)

          if not success then
            return
          end

          if node.type == "file" then
            require("neo-tree.command").execute({ action = "close" })
          end
        end,
      },
      window = {
        mappings = {
          ["<CR>"] = "open_and_close_neotree",
          ["<S-CR>"] = "open",
        },
      },
    },
  },
}
