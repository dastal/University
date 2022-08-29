note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	done:BOOLEAN
			-- check if the action is done

feature

	loop_elements(amount:INTEGER)
			-- creates <amount> elements (used for examples and testing)
		require
			no_prior_elements: all_elements.is_empty
		do

		ensure
			correct_amount: all_elements.count = amount
		end

	loop_constraints(input: LINKED_LIST[ELEM], amount: INTEGER)
			-- creates <amount> of constraints with elements in <input>
		require
			no_prior_constraints: all_constraints.is_empty
		do

		ensure
			correct_amount: all_constraints.count = amount
		end

	clear_elements()
			-- resets the all_elements list and the all_constraints list
		require
			elements_empty_or_not: all_elements.count >= 0
			constraints_empty_or_not: all_constraints.count >= 0
		do

		ensure
			elements_empty: all_elements.is_empty
			constraints_empty: all_constrains.is_empty
		end

	clear_constraints()
			-- resets the all_constraints list
		require
			empty_or_not: all_constraints.count >= 0
		do

		ensure
			empty: all_constraints.is_empty
		end


	user_interface()
			-- textual user interface
		require

		do

		ensure

		end

	graphical_user_interface()
			-- allows usage of a GUI
		require

		do

		ensure

		end


	run_example(number:INTEGER)
			-- runs example <number>
		require
			not_terminated: not done
		do

		ensure
			terminated: done
		end
end
