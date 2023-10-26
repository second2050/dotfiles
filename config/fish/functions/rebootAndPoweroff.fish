function reboot;
    if test $XDG_CURRENT_DESKTOP == "KDE"
        /usr/bin/qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logoutAndReboot
    else
        /usr/bin/reboot
    end
end
function poweroff;
    if test $XDG_CURRENT_DESKTOP == "KDE"
        /usr/bin/qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logoutAndShutdown
    else
        /usr/bin/poweroff
    end
end

