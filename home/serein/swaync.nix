{
  config,
  pkgs,
  ...
}: {
  services.swaync = {
    enable = true;
    # Inline the entire CSS here:
    style = ''

      @define-color cc-bg #242830;
      @define-color noti-bg #242830;
      @define-color noti-bg-darker #1b2732;
      @define-color noti-bg-hover #1b1e25;
      @define-color noti-bg-focus #1b2732;
      @define-color noti-close-bg #1b2732;
      @define-color noti-close-bg-hover #242830;
      @define-color text-color-disabled #86AFEF;
      @define-color bg-selected #242830;

      @define-color dnd-switch #1b1e25;
      @define-color dnd-switch-checked #5b718a;
      @define-color dnd-switch-button #86AFEF;

      @define-color noti-bg-cards #5b718a;
      @define-color noti-first-card #5b718a;
      @define-color noti-close-button #1b1e25;

      @define-color text-color #86AFEF;

      * {
          font-family: JetBrains Mono Nerd Font;
      }

      .notification {
          border-radius: 10px;
          padding: 0;
          border: 2px solid @text-color;
          background: @noti-bg-cards;
      }

      .notification-content {
          background: transparent;
          padding: 10px;
      }

      .close-button {
          background: @noti-close-bg;
          color: @text-color;
          text-shadow: none;
          padding: 0;
          border-radius: 100%;
          margin-top: 25px;
          margin-right: 5px;
          box-shadow: none;
          border: none;
          min-width: 26px;
          min-height: 26px
      }

      .close-button:hover {
          box-shadow: none;
          background: @noti-close-button;
          transition: all .15s ease-in-out;
          border: none;
      }

      .notification-default-action,
      .notification-action {
          padding: 4px;
          margin: 0;
          box-shadow: none;
          background: @noti-bg;
          border: none;
          color: @text-color;
          transition: all .15s ease-in-out;
          font-size: 14pt;
      }

      .notification-default-action:hover,
      .notification-action:hover {
          -gtk-icon-effect: none;
          background: @noti-bg-hover;
          /* text-shadow: 0 0 3px @text-color; */
      }

      .notification-default-action {
          border-radius: 8px;
      }

      .notification-default-action:not(:only-child) {
          border-bottom-left-radius: 0;
          border-bottom-right-radius: 0
      }

      .notification-action {
          border-radius: 0;
          border-top: none;
          border-right: none
      }

      .notification-action:first-child {
          border-bottom-left-radius: 10px;
          background: @text-color;
      }

      .notification-action:last-child {
          border-bottom-right-radius: 10px;
          background: @bgblack
      }

      .notification-group-headers {
        font-weight: bold;
        font-size: 14pt;
        color: @white;
      }

      .notification-group-icon {
        color: @red;
        margin-right: 8px;
      }

      .notification-group-collapse-button {
        background: @noti-close-bg;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .notification-group-collapse-button:hover {
        background: @noti-close-bg-hover;
        color: @red;
      }

      .notification-group-close-all-button {
        background: @noti-close-bg;
        border: none;
        min-width: 24px;
        min-height: 24px;
      }

      .notification-group-close-all-button:hover {
        background: @noti-close-button;
        color: @text-color;
      }

      .body-image {
          margin-top: 0px;
          background-color: transparent;
          border-radius: 10px
      }

      .summary {
          font-size: 14pt;
          font-weight: bold;
          background: transparent;
          color: @text-color;
          margin-left: 10px;
          /* text-shadow: 0 0 3px @red; */
      }

      .time {
          font-size: 14pt;
          font-weight: bold;
          font-style: italic;
          background: transparent;
          color: @text-color;
          text-shadow: none;
          margin-right: 10px
      }

      .body {
          font-size: 14pt;
          font-weight: normal;
          background: transparent;
          color: @text-color;
          text-shadow: none;
          font-weight: bold;
          margin-left: 10px;
      }

      .image {
          background: transparent;
          border-radius: 8px;
      }

      .floating-notifications .notification-row {
          background: transparent;
          margin: 15px 10px 0 0;
      }

      .blank-window {
          background: alpha(black, 0.0)
      }

      .widget-title {
          color: @text-color;
          margin: 20px 20px 5px 20px;
          font-size: 14pt;
          font-weight: bold;
          /* text-shadow: 0 0 3px @red; */
      }

      .widget-title>button {
          font-size: 14pt;
          font-weight: bold;
          font-family: 'JetBrainsMono Nerd Font';
          color: @text-color;
          text-shadow: none;
          background: @noti-bg;
          border: 1px solid @text-color;
          box-shadow: none;
          border-radius: 10px;
      }

      .widget-title>button:hover {
          background: @noti-close-button;
      }

      .widget-dnd {
          color: @text-color;
          margin: 5px 20px 5px 20px;
          font-size: 14pt;
          font-weight: bold;
      }

      .widget-dnd>switch {
          font-size: initial;
          border-radius: 999px;
          background: @dnd-switch;
          box-shadow: none;
          padding: 1px;
          transition: all .1s ease-in-out;
      }

      .widget-dnd>switch:checked {
          background: @dnd-switch-checked;
      }

      .widget-dnd>switch slider {
          background: @dnd-switch-button;
          border-radius: 999px
      }

      .widget-label {
          margin: 10px;
      }

      .widget-backlight {
          font-size: 17pt;
      }

      .widget-volume {
          font-size: 12pt;
      }

      .widget-backlight#KB {
          font-size: 12pt;
      }

      .widget-label>label {
          font-size: 14pt;
          color: @text-color;
      }

      .widget-menubar>box>.menu-button-bar>button {
          border: none;
          background: transparent
      }

      .topbar-buttons>button {
          border: none;
          background: transparent
      }

    '';

    settings = {
      positionX = "center";
      positionY = "top";
      control-center-margin-top = 10;
      control-center-margin-bottom = 2;
      control-center-margin-right = 10;
      control-center-margin-left = 10;
      notification-icon-size = 48;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 5;
      timeout-low = 5;
      timeout-critical = 20;
      fit-to-screen = true;
      control-center-width = 425;
      notification-window-width = 400;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      widgets = [
        "label"
        "mpris"
        "volume"
        "backlight"
        "title"
        "dnd"
        "notifications"
      ];
      widget-config = {
        title = {
          text = "󰂚 Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        backlight = {
          label = "⛭ ";
          device = "nvidia_wmi_ec_backlight";
          min = 10;
        };
        "backlight#KB" = {
          label = " ";
          device = "asus::kbd_backlight";
          subsystem = "leds";
        };
        volume = {label = "  ";};
        mpris = {
          image-size = 96;
          image-radius = 6;
        };
        dnd = {text = "Do Not Disturb";};
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
      };
    };
  };
}
