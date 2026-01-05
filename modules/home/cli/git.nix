{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Luytan";
        email = "luytan@khora.me";
      };
    };
    signing = {
      key = "9DF7DF3488EC912A";
      signByDefault = true;
    };
  };
}
