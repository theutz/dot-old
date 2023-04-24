{ config, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Tokyo Night Storm";
    font = {
      name = "Berkeley Mono";
      size = 15;
    };
    keybindings = { };
    settings = {
      window_border_width = "0.5pt";
      draw_minimal_borders = "no";
      window_margin_width = 0;
      window_padding_width = 3;
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      tab_bar_edge = "top";
      tab_bar_margin_width = "10.0";
      tab_bar_margin_height = "10.0 10.0";
      tab_bar_style = "slant";
      tab_bar_align = "right";
      tab_bar_min_tabs = 2;
      background_opacity = "0.9";
      dynamic_background_opacity = "yes";
      shell_integration = "disabled";
      macos_option_as_alt = "both";
    };
  };

}
