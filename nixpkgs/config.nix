{
    packageOverrides =
	pkgs: with pkgs; {
	    myPackages = pkgs.buildEnv {
		name = "my-packages";
		paths = [
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

