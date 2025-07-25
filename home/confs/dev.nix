{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [git gitui];
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-vscode.cpptools
      #llvm-vs-code-extensions.vscode-clangd
      github.github-vscode-theme
      bbenoist.nix
    ];
  };
}
