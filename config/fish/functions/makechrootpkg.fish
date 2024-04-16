if command --query makechrootpkg
    function makechrootpkg --description 'alias makechrootpkg makechrootpkg -r /var/lib/aurbuild/ -u'
        command makechrootpkg -r /var/lib/aurbuild/$(uname -m) -u $argv
    end
end
