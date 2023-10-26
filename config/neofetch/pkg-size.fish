#!/usr/bin/env fish
#set variables with sizes

set pacman 0
set flatpak_apps 0
set flatpak_runtimes 0

if test -f /bin/expac
    set pacman (expac -Q -H M '%m\t%n' | awk '{print $1" +"}') 0
end
if test -d /var/lib/flatpak
    set flatpak_apps (math --scale=2 -- (du --summarize /var/lib/flatpak/app | awk '{print $1}') / 1024)
    set flatpak_runtimes (math --scale=2 -- (du --summarize /var/lib/flatpak/runtime | awk '{print $1}') / 1024)
end

# output complete usage
echo (math -- $pacman + $flatpak_apps + $flatpak_runtimes) MiB\

#echo (math -- (expac -Q -H M '%m\t%n' | awk '{print $1" +"}') 0) MiB
