if which trash &> /dev/null
	function rm --wraps trash;
		/usr/bin/trash $argv;
	end
end
