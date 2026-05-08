{
  pkgs,
  lib,
  ...
}: {
  plugins.harpoon = {
    enable = true;

    enableTelescope = true;

    settings = {
      settings = {
        save_on_toggle = true;
        sync_on_ui_close = true;
      };
    };
  };

  keymaps = [
    # Add file
    {
      mode = "n";
      key = "<leader>a";
      action = ''
        function()
          require("harpoon"):list():add()
        end
      '';
      options = {
        desc = "Harpoon file";
      };
    }

    # Toggle quick menu
    {
      mode = "n";
      key = "<leader>hh";
      action = ''
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end
      '';
      options = {
        desc = "Harpoon menu";
      };
    }

    # Harpoon select 1-4
    {
      mode = "n";
      key = "<leader>h1";
      action = ''
        function()
          require("harpoon"):list():select(1)
        end
      '';
      options.desc = "Harpoon file 1";
    }

    {
      mode = "n";
      key = "<leader>h2";
      action = ''
        function()
          require("harpoon"):list():select(2)
        end
      '';
      options.desc = "Harpoon file 2";
    }

    {
      mode = "n";
      key = "<leader>h3";
      action = ''
        function()
          require("harpoon"):list():select(3)
        end
      '';
      options.desc = "Harpoon file 3";
    }

    {
      mode = "n";
      key = "<leader>h4";
      action = ''
        function()
          require("harpoon"):list():select(4)
        end
      '';
      options.desc = "Harpoon file 4";
    }

    # Previous / next
    {
      mode = "n";
      key = "<leader>hp";
      action = ''
        function()
          require("harpoon"):list():prev()
        end
      '';
      options.desc = "Previous harpoon";
    }

    {
      mode = "n";
      key = "<leader>hn";
      action = ''
        function()
          require("harpoon"):list():next()
        end
      '';
      options.desc = "Next harpoon";
    }

    # Telescope harpoon picker
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
