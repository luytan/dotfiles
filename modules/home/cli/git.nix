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
      key = "3EB04E2CB1FB228A328769513914A6CF369AA213!";
      signByDefault = true;
    };
  };
}
