if command --query trash
	function rm --wraps trash;
		/usr/bin/trash $argv;
	end
else
    function rm --wraps rm;
        command rm --interactive=always $argv
    end
end
