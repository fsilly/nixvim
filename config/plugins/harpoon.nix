{
  pkgs,
  lib,
  ...
}: {
  extraPlugins = [ pkgs.vimPlugins.harpoon2 ];

  extraConfigLua = ''
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
    require("telescope").load_extension("harpoon")
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action = ''
        function()
          require("harpoon.mark").add_file()
        end
      '';
      options = {
        desc = "Harpoon file";
      };
    }

    {
      mode = "n";
      key = "<leader>h";
      action = ''
        function()
          require("harpoon.ui").toggle_quick_menu()
        end
      '';
      options = {
        desc = "Harpoon menu";
      };
    }

    {
      mode = "n";
      key = "<leader>hp";
      action = ''
        function()
          require("harpoon.ui").nav_prev()
        end
      '';
      options.desc = "Previous harpoon";
    }

    {
      mode = "n";
      key = "<leader>hn";
      action = ''
        function()
          require("harpoon.ui").nav_next()
        end
      '';
      options.desc = "Next harpoon";
    }

    {
      mode = "n";
      key = "<leader>fh";
      action = ''
        function()
          require("telescope").extensions.harpoon.marks()
        end
      '';
      options.desc = "Harpoon files";
    }
  ];
}
