{ ... }:

let
  username = "ollie"
in

{
  imports = [
   # ../user
  ];

 # modules = {
  #  /* Shell */
  #  shell = {
  #    zsh.enable = true;
  #    fish.enable = true;
  #  };
  #};

  home.username = username;
  home.homeDirectory = "/home" + username;
  home.stateVersion = "25.05";
}

