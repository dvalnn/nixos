{pkgs, ... }: 
{
	programs.neovim = {

		enable = true;
		vimAlias = true;

		extraLuaConfig = builtins.readFile ./lua/init.lua;

		plugins = with pkgs.vimPlugins; [

		];
	};
}
