{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.neovim;
in

{
    options = {
        modules.apps.neovim.enable = lib.mkEnableOption "Toggle neovim"; 
    };

    config = lib.mkIf cfg.enable {
        programs.neovim = {
            enable = true;
            defaultEditor = true;

            plugins = with pkgs.vimPlugins; [
            {
                plugin = gruvbox-nvim;
                config = ''
                lua << EOF
                require("gruvbox").setup({
                    contrast = "hard",
                    transparent_mode = true,
                })
                vim.o.background = "dark"
                vim.cmd("colorscheme gruvbox")
                EOF
                '';
            }
            ];
        };
    };
}
