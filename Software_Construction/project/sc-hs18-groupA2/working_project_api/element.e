note
	description: "Summary description for {ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEM_LIB
create
	set_elements, set_constraints

feature {NONE}

	set_elements
			-- Create an empty element list
	do

	end

	set_constraints
			--Create an empty constraint list
	do

	end

feature

	add_elements(elements:LINKED_LIST[ELEM])
			-- add elements to the element list
		require
			checking_if_already_in: across elements as e loop element_in_list(e.item)
		do

		ensure
			n_elements_more: all_elements.count = old all_elements.count + elements.count
			elements_added: all_elements.last = elements.last
		end

	add_constraints(constraints:LINKED_LIST[CONSTR])
			-- add constraints to the constraint list
		require
			checking_if_already_in: across constraints as c loop not constraint_in_list(c.item)
		do

		ensure
			n_constraints_more: all_constraints.count = old all_constraints.count + constraints.count
			constraint_added: all_constraints.last = constraints.last
		end

	remove_elements(elements: LINKED_LIST[ELEM])
			-- remove elements from list and all constraints containing those elements
		require
			checking_if_in_list: across elements as e loop element_in_list(e.item)
		do

		ensure
			new_amount_elements: all_elements.count = old all_elements.count - elements.count
			elements_not_in_list: across elements as e loop not all_elements.has(e.item)
			-- constraints_not_in_list: across all_constraints as c loop ...
		end

	remove_constraints(constraints: LINKED_LIST[CONSTR])
			-- remove constraints from list
		require
			checking_if_in_list: across constraints as c loop constraint_in_list(c.item)
		do

		ensure
			less_constraint_pairs: all_constraints.count = old all_constraints.count - constraints.count
			constraints_not_in_list: not across constraints as c loop constraint_in_list(c.item)
		end


	remove_constraint_containing(element: ELEM, value: INTEGER) -- (default 0)(falls 2 dennimmer wenns i de zweite stell isch wirds glöscht, falls 1 umgekehrt))

		require
			in_list: element_in_list(element)
			possible_values: value >= 0 and value <=2
		do

		ensure

		end



feature {NONE}

	all_elements: LINKED_LIST[ELEM]
		-- list of all elements
	all_contraints: LINKED_LIST[CONSTR]
		-- list of all constraints

feature

	element_in_list(element: ELEM): BOOLEAN
		-- Check if the elements are in the elements list
	do

	end

	constraint_in_list(constraint: CONSTR): BOOLEAN
		-- Check if the contains are in the constraints list
	do

	end

	-- element_in_constraint für remove_element
end
