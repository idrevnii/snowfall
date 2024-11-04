{ config, pkgs, ... }:
let 
  myAliases = {
    docker-compose = "podman-compose";
    cat = "bat";
    ls = "eza --icons=always";
    zen = "MOZ_ENABLE_WAYLAND=0 zen";

    fullClean = '' 
        nix-collect-garbage --delete-old

        sudo nix-collect-garbage -d

        sudo /run/current-system/bin/switch-to-configuration boot
    '';
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
    fullRebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/ && home-manager switch --flake ~/.dotfiles/ -b backup";
    homeRebuild = "home-manager switch --flake ~/.dotfiles/ -b backup";
};
in
{
  programs = {
	zsh = {
		enable = true;
		enableAutosuggestions = true;
		syntaxHighlighting.enable = true;
		initExtra = '' 
            eval "$(zoxide init --cmd cd zsh)" && 
        ''; 
		shellAliases = myAliases;
		oh-my-zsh = {
			enable = true;
			custom = "$HOME/.oh-my-custom";
			plugins = [
				"git"
				"history"
				"wd"
			];
		};
	};
  };
}
