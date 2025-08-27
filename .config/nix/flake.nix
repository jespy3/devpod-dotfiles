{
  description = "My dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # or use 'nixpkgs/stable' or 'nixpkgs/nixos-ustable'
  };

  outputs = { nixpkgs, ... }: {
    packages.x86_64-linux.myPackages = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in pkgs.buildEnv {
      name = "my-packages";
      paths = with pkgs; [
        neovim
        bash-completion
        fd
        ripgrep
        fzf
        tmux
      ];
    };
  };
}

