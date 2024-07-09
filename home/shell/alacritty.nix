{...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      cursor = {
        blink_interval = 550;
        unfocused_hollow = false;

        style = {
          blinking = "On";
          shape = "Block";
        };
      };
      window = {
        decorations = "none";
        dynamic_title = true;
        opacity = 1.0;
        padding = {
          x = 15;
          y = 15;
        };
      };
    };
  };
}
