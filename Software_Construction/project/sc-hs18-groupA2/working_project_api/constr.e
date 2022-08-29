note
	description: "Summary description for {CONSTR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CONSTR

create
	make

feature{NONE}

	make(an_elem1:like el1, an_elem2:like el2)
			-- new constraint containing two elements
		require
			element_1_not_void: elem1 /= Void
			element_1_not_empty: not elem1.is_empty
			element_2_not_void: elem2 /= Void
			element_2_not_empty: not elem2.is_empty
		do
		ensure
			element_1_set: el1 = an_elem1
			element_2_set: el2 = an_elem2
		end
feature

	el1: ELEM
			--Name of the first element in constraint
	el2: ELEM
			--Name of the second element in constraint

invariant

	el1_not_void: el1 /= Void
	el2_not_void: el2 /= Void
	el1_not_empty: not el1.is_empty
	el2_not_empty: not el2.is_empty
end
