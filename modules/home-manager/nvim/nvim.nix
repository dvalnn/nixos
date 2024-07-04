
pkgs:
{
	enable = true;
	vimAlias = true;

	extraLuaConfig = builtins.readFile ./config.lua;

	plugins = with pkgs.vimPlugins; [

	];

}

