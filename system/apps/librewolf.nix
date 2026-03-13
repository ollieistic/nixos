{ config, lib, pkgs, ... }:

let
  cfg = config.modules.apps.librewolf;
in

{
  options = {
    modules.apps.librewolf.enable = lib.mkEnableOption "Enable Librewolf";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true;
    # programs.firefox.package = pkgs.librewolf;
    programs.firefox.policies.ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "file://${
            builtins.fetchurl {
              url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              sha256 = "1kvj2kwwiih7yqiirqha7xfvip4vzrgyqr4rjjhaiyi5ibkcsnvq";
            }
          }";
          private_browsing = true;
          updates_disabled = true;
          default_area = "navbar";
        };
	"addon@darkreader.org" = {
	  installation_mode = "force_installed";
	  install_url = "file://${
	    builtins.fetchurl {
	      url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
	      sha256 = "0hq2wjqk0azdi7nvs8r6xc0avvdg2qn56r0jv1xja81zqpd6qgls";
	    }
	  }";
	  updates_disabled = true;
	  default_area = "navbar";
	};
	"{4520dc08-80f4-4b2e-982a-c17af42e5e4d}" = {
	  installation_mode = "force_installed";
	  install_url = "file://${
	    builtins.fetchurl {
	      url = "https://addons.mozilla.org/firefox/downloads/latest/tokyo-night-milav/latest.xpi";
	      sha256 = "1b4p10pyq5m90q070d29kgv4yr5bfic5gj3nk2fcis05wv0k276r";
	    }
	  }";
	};
    };
  };
}

