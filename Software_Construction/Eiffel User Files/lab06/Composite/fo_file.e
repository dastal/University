note
	description: "Leaf of the Composite Design Pattern."
	author: "Anna Jancso"

class
	FO_FILE

inherit
	FILE_OBJECT

create
	make

feature -- Initialization

	make(a_name, a_content: STRING)
		-- Create with values `a_name' and `a_content'
		require
			non_empty_a_name: not a_name.is_empty
			no_illegal_chars: not has_illegal_chars(a_name)
		do
			name := a_name
			content := a_content
		ensure
			name_set: name.is_equal (a_name)
			content_set: content.is_equal(a_content)
		end

feature -- Access

	content: STRING
		-- Content of the file

	size: INTEGER
		-- Compute size depending `content'
		local
			initial: INTEGER
		do
			-- Initial size of an empty file
			initial := 10
			Result := (5*content.count) + initial
		end

end

