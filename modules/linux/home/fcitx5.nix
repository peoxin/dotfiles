{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        kdePackages.fcitx5-chinese-addons
        catppuccin-fcitx5
      ];
      settings.inputMethod = {
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0".Name = "keyboard-us";
        "Groups/0/Items/1".Name = "shuangpin";
      };
      settings.globalOptions = {
        Hotkey.AltTriggerKeys = false;
      };
      settings.addons = {
        pinyin.globalSection.ShuangpinProfile = "Xiaohe";
        pinyin.globalSection.PageSize = "7";
        pinyin.globalSection.CloudPinyinEnabled = "True";
        cloudpinyin.globalSection.Backend = "Baidu";
        classicui.globalSection.Font = "Sans 12";
        classicui.globalSection.Theme = "catppuccin-latte-teal";
        classicui.globalSection.DarkTheme = "catppuccin-mocha-teal";
        classicui.globalSection.UseDarkTheme = "True"; # follow system light/dark color scheme
        classicui.globalSection."Vertical Candidate List" = "True";
        classicui.globalSection.WheelForPaging = "True";
      };
    };
  };
}
