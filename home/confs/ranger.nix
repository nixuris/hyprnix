{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [ueberzugpp atool zip unzip p7zip];
  services = {
    udiskie.enable = true;
    udiskie.tray = "auto";
  };
  programs.ranger = {
    enable = true;
    settings = {
      preview_images_method = "ueberzug";
    };
    mappings = {
      DD = "shell mv %s ~/.local/share/Trash/files/";
    };
  };
  home.file.".config/ranger/commands.py".text = ''
    import os
    from ranger.api.commands import Command
    from ranger.core.loader import CommandLoader

    class compress(Command):
        def execute(self):
            """ Compress marked files to current directory """
            cwd = self.fm.thisdir
            marked_files = cwd.get_selection()

            if not marked_files:
                return

            def refresh(_):
                cwd = self.fm.get_directory(original_path)
                cwd.load_content()

            original_path = cwd.path
            parts = self.line.split()
            au_flags = parts[1:]

            descr = "compressing files in: " + os.path.basename(parts[1])
            obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr, read=True)

            obj.signal_bind('after', refresh)
            self.fm.loader.add(obj)

        def tab(self, tabnum):
            """ Complete with current folder name """
            extension = ['.zip', '.tar.gz', '.rar', '.7z']
            return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
  '';
}
