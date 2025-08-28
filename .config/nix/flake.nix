{
  description = "My dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05"; # or use 'nixpkgs/stable' or 'nixpkgs/nixos-ustable'
  };

  outputs = { nixpkgs, ... } @ inputs: let
    systems = [ "x86_64-linux" "aarch64-linux" ];
  in
  {
    packages = builtins.listToAttrs (map (system:
      {
        name = system;
        value = let
          pkgs = import nixpkgs { inherit system; };
        in {
          myPackages = pkgs.buildEnv {
            name = "my-packages-${system}";
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
      }) systems);
  };
}

