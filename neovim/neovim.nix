{pkgs, config, nixvim, ...}:
{
  imports = [
    nixvim.homeManagerModules.nixvim 
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    options = {
      guicursor = "";

      number = true;
      relativenumber = true;

      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = true;

      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      undofile = true;

      hlsearch = false;
      incsearch = true;

      termguicolors = true;

      scrolloff = 8;
      signcolumn = "yes";

      updatetime = 50;

      colorcolumn = "80";
    };
    extraConfigLua = ''
    vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    vim.opt.isfname:append("@-@")
    '';
    colorschemes.catppuccin = {
      enable = true;
      transparentBackground = true;
    };
    plugins = {
      treesitter.enable = true;
      treesitter.ensureInstalled = "all";
      nix.enable = true;
      chadtree.enable = true;
      neogit  = {
        enable = true;
        autoRefresh = true;
      };
      nvim-autopairs.enable = true;
      lsp = {
        enable = true;
        servers = {
          rust-analyzer.enable = true;
          nixd.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua-ls.enable = true;
          cssls.enable = true;
          cmake.enable = true;
          bashls.enable = true; 
        };
      };
      luasnip.enable = true;
      cmp-buffer = { enable = true; };

      cmp-emoji = { enable = true; };

      cmp-nvim-lsp = { enable = true; };

      cmp-path = { enable = true; };

      cmp_luasnip = { enable = true; };

      nvim-cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "nvim_lua"; }
          { name = "path"; }
        ];

        snippet = { expand = "luasnip"; };

        window = {
          completion = {
            winhighlight =
              "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
              scrollbar = false;
              sidePadding = 0;
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            };

            documentation = {
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
              winhighlight =
                "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
              };
            };
            mapping = {
              "<C-n>" = "cmp.mapping.select_next_item()";
              "<C-p>" = "cmp.mapping.select_prev_item()";
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-e>" = "cmp.mapping.close()";
              "<CR>" =
                "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
                "<Tab>" = {
                  modes = [ "i" "s" ];
                  action =
            # lua
            ''
            function(fallback)
            if cmp.visible() then
            cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
            fallback()
            end
            end
            '';
          };
          "<S-Tab>" = {
            modes = [ "i" "s" ];
            action =
            # lua
            ''
            function(fallback)
            if cmp.visible() then
            cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
            fallback()
            end
            end
            '';
          };
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>pf"="find_files";
          "<C-p>"="git_files";
          "<leader>vh"="help_tags";
        };
      };
    };
    keymaps = [
      {
        key="<leader>e";
        action="<cmd>CHADopen<CR>";
        options = {
          silent=true;
          desc="Open ChadTree because I am a chad!";
        };
      }
      {
        key="<leader>E";
        action="<cmd>CHADopen<CR>";
        options = {
          silent=true;
          desc="Open ChadTree because I am a chad!";
        };
      }
    ];
  };
}
