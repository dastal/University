note
	description: "Summary description for {ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT

create
	make  -- creating/initializing a new object

feature{NONE}

	make(element_name: like name)
			-- Set element to element_name
		require
			an_element_not_void: element_name /= Void
			an_element_not_empty: not element_name.is_empty
		do
			name := element_name
		ensure
			element_set: name = element_name
		end

feature

	name: STRING
			-- Name of the element
end
