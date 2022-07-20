#!/bin/sh
cp -r ./i3 ~/.config/
cp -r ./i3status ~/.config/
cp -r ./termite ~/.config/
cp -r ./ranger ~/.config/
cp -r ./polybar ~/.config/
cp -r ./twmn ~/.config/

cp ./.i3lock-gen-image.sh ~/
cp ./.sfw.sh ~/
cp ./.nsfw.sh ~/
cp ./.lockscreen.sh ~/
cp ./.start.sh ~/
cp ./.randomwallpaper.sh ~/

cp -r ./.wallpaper ~/
cp -r ./i3status-rust ~/.config/
echo "Done. please relogin into i3"
