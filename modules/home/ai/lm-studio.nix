{ inputs, ... }:
{
  home.packages = [ inputs.lmstudio.packages.x86_64-linux.default ];
}
