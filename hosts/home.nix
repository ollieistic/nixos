{ ... }:

let
  name = "ollie"
in

{
  home.username = name;
  home.homeDirectory = "/home" + name;
  home.stateVersion = "25.05";
}

