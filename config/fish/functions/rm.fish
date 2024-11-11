if command --query trash
	function rm --wraps trash;
		/usr/bin/trash $argv;
	end
else
    function rm --wraps rm;
        # using short switch because bsd rm does not support long switches.
        command rm -i $argv
    end
end

