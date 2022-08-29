note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_ELEMENT_LIBRARY

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end
feature
	el1: ELEMENT
	el2: ELEMENT
	el3: ELEMENT
	constr1: CONSTRAINT
	constr2: CONSTRAINT
	some_elements: ARRAYED_LIST[ELEMENT]
	some_constraints: ARRAYED_LIST[CONSTRAINT]
	element_string: ARRAYED_LIST[STRING]
	constraint_first_string: ARRAYED_LIST[STRING]
	constraint_second_sring: ARRAYED_LIST[STRING]
	a: STRING
	b: STRING
	c: STRING
	d: STRING
	e: STRING
	f: STRING

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			create el1.make("elem1")
			create el2.make("elem2")
			create el3.make("elem3")
			create constr1.make(el1, el2)
			create constr2.make(el2, el3)
			create some_elements.make(10)
			create some_constraints.make(10)
			create element_string.make(10)
			create constraint_first_string.make(10)
			create constraint_second_sring.make(10)
			a := "a"
			b := "b"
			c := "c"
			d := "d"
			e := "e"
			f := "f"
			some_elements.extend(el1)
			some_elements.extend(el2)
			some_constraints.extend(constr1)
			some_constraints.extend(constr2)
			element_string.extend(a)
			element_string.extend(b)
			constraint_first_string.extend(c)
			constraint_first_string.extend(d)
			constraint_first_string.extend(e)
			constraint_second_sring.extend(f)
		end

feature -- Test routines

	tc_transfer
			-- test transfer routine
		do
			-- transfer(element_string, constraint_first_string, constraint_second_string)
		end

	tc_add_element
			-- test add_element routine
		do
			-- add_element(el1)
			-- bruuchts en assert??
		end

	tc_add_constraint
			-- test add_constraint routine
		do
			-- add_constraint(constr1)
		end

	tc_add_multiple_elements
			-- test add_multiple_elements routine
		do
			-- add_multiple_elements(some_elements)
		end

	tc_add_multiple_constraints
			-- test add_multiple_constraints routine
		do
			-- add_multiple_constraints(some_constraints)
		end

	tc_add_elements_input
			-- test add_elements_input routine
		do
			-- add_elements_input(element_string)
		end

	tc_add_constraints_input
			-- test add_constraints_input routine
		do
			-- add_constraints_input(constraint_first_string, constraint_second_string)
		end

	tc_remove_element
			-- test remove_element routine
		do
			-- add_multiple_elements(some_elements)
			-- add_multiple_constraints(some_constraints)
			-- remove_element(el1)
		end

	tc_remove_constraint
			-- test remove_constraint routine
		do
			-- add_multiple_constraints(some_constraints)
			-- remove_constraint(constr1)
		end

	tc_remove_constraints_containing_default
			-- test remove_constraints_containing routine
		do
			---
		end

end
