{
  config.opts = {
    number = true;
    relativenumber = true;

    tabstop = 4;
    softtabstop = 4;
    #showtabline = 2;
    expandtab = true;

    shiftwidth = 4;
    smartindent = true;
    autoindent = true;
    breakindent = true;
    backspace = "indent,eol,start";
    cindent = false;

    hlsearch = true;
    incsearch = true;

    wrap = true;

    splitbelow = true;
    splitright = true;

    mouse = "a";

    ignorecase = true;
    smartcase = true;
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";
    fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:";

    # Much better completions
    updatetime = 50;
    completeopt = ["menuone" "noselect" "noinsert"];

    # swapfile = false;
    # backup = false;
    undofile = true;
    #iskeyword = ''append("-")'';

    # Enable 24-bit colors
    termguicolors = true;

    signcolumn = "yes";

    cursorline = true; # Highlight the line where the cursor is located

    # Set fold settings
    # These options were reccommended by nvim-ufo
    # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # Always keep 8 lines above/below cursor unless at start/end of file
    scrolloff = 8;

    # Reduce which-key timeout to 10ms
    timeoutlen = 250;
    # ttimeoutlen = 20;

    # Set encoding type
    encoding = "utf-8";
    fileencoding = "utf-8";

    sessionoptions = "blank,buffers,curdir,folds,globals,help,options,tabpages,winsize,winpos,terminal,localoptions";

    # Experimental
    # cmdheight = 2; # 0
    # showmode = false;
    # pumheight = 0;
    # colorcolumn = "80"; # Place a column line
  };
  config.extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        vim.opt_local.cinkeys:remove("0#")
        vim.opt_local.indentkeys:remove("0#")
      end,
    })
  '';
}
