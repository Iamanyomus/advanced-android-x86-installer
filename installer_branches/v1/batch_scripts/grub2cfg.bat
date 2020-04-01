(
  echo.
  echo submenu  'PhoenixOS DarkMatter  Hotkey=d'  --hotkey=d  --class submenu  --class icon-dm  {
  echo insmod all_video
  echo set reviewpause=1
  echo savelast 13 'PhoenixOSDarkMatter'
  echo echo loading  PhoenixOSDarkMatter
  echo #
  echo source $prefix/userfiles/user.configs/PhoenixOSDarkMatter.cfg
  echo #
  echo }
) >> C:\grub2\grub.cfg