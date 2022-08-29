note
	description: "Summary description for {ELEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEM

create
	make  -- creating/initializing a new object

feature{NONE}

	make(an_element: like name)
			-- Set element to an_element
		require
			an_element_not_void: an_element /= Void
			an_element_not_empty: not an_element.is_empty
		do
		ensure
			element_set: name = an_element
		end

feature

	name: G
			-- Name of the element

invariant
	element_not_void: element /= Void
	element_not_empty: not element.is_empty
end
