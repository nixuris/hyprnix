{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [cava];
  home.file.".config/cava/config".text = ''
    [general]
    framerate = 120
    autosens = 1
    overshoot = 20
    sensitivity = 100
    bars = 0
    bar_width = 2
    bar_spacing = 1
    lower_cutoff_freq = 50
    higher_cutoff_freq = 10000
    sleep_timer = 0

    [input]
    method = pulse
    source = auto

    [output]
    method = noncurses
    orientation = bottom
    channels = stereo
    mono_option = average
    reverse = 0
    raw_target = /dev/stdout
    data_format = binary
    bit_format = 16bit
    ascii_max_range = 1000
    bar_delimiter = 59
    frame_delimiter = 10
    sdl_width = 1000
    sdl_height = 500
    sdl_x = -1
    sdl_y = -1
    sdl_full_screen = 0
    xaxis = none
    alacritty_sync = 0
    vertex_shader = pass_through.vert
    fragment_shader = bar_spectrum.frag
    continuous_rendering = 0
    disable_blanking = 0
    show_idle_bar_heads = 1
    waveform = 0

    [color]
    gradient = 1
    gradient_count = 4
    gradient_color_1 = '#86afef'
    gradient_color_2 = '#86afef'
    gradient_color_3 = '#86afef'
    gradient_color_4 = '#86afef'
    gradient_color_5 = '#86afef'
    gradient_color_6 = '#86afef'
    gradient_color_7 = '#86afef'
    gradient_color_8 = '#86afef'

    [smoothing]
    noise_reduction = 77

    [eq]
    1 = 1
    2 = 1
    3 = 1
    4 = 1
    5 = 1
  '';
}
