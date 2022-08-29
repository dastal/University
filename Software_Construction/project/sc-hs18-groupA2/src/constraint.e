note
	description: "Summary description for {CONSTRAINT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONSTRAINT

create
	make

feature{NONE}

	make(an_element_1:like el_1; an_element_2:like el_2)
			-- new constraint containing two elements
		require
			element_1_not_void: an_element_1 /= Void
			element_2_not_void: an_element_2 /= Void
		do
			el_1 := an_element_1
			el_2 := an_element_2
		ensure
			element_1_set: el_1 = an_element_1
			element_2_set: el_2 = an_element_2
		end
feature

	el_1: ELEMENT
			--Name of the first element in constraint
	el_2: ELEMENT
			--Name of the second element in constraint

invariant

	el1_not_void: el_1 /= Void
	el2_not_void: el_2 /= Void
end
