note
	description: "Composite of the Composite Design Pattern."
	author: "Anna Jancso"

class
	FO_FOLDER

inherit
	FILE_OBJECT

create
	make

feature -- Initialization

	make(a_name: STRING)
			-- Create with values `a_name'
		require
			non_empty_a_name: not a_name.is_empty
			no_illegal_chars: not has_illegal_chars(a_name)
		do
			name := a_name
			create children.make
		ensure
			name_set: name.is_equal (a_name)
		end

feature -- Element change

	add(a_fo: FILE_OBJECT)
			-- Add file object to `children'
		do
			children.extend(a_fo)
		ensure
			child_added: children.count = old children.count + 1
		end

feature -- Access

	children: LINKED_LIST[FILE_OBJECT]
		-- Children added

	size: INTEGER
		-- Compute sum of sizes of children
		local
			total: INTEGER
		do
			-- Initial size of an empty folder
			total := 100

			across
				children as child
			loop
				total := total + child.item.size
			end

			Result := total
		end
end
