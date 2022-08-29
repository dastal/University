note
	description: "Summary description for {INPUT_HANDLER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INPUT_HANDLER[G->HASHABLE]

inherit
	ANY

create
	input_start

feature

	trf: ELEMENT_LIBRARY[G]

	input_start
		do
			create elements_for_input.make(50)
			create constraints_first_element.make (50)
			create constraints_second_element.make (50)
			create trf.ele_lib
			create constraint_remove_first_element.make(50)
			create constraint_remove_second_element.make(50)
			read_elements_and_constraints
		end


	read_elements_and_constraints
			-- read lines of elements and constraints from the console
		local
			all_elements_are_in: BOOLEAN
			all_constraints_are_in: BOOLEAN
			needed_elements_removed: BOOLEAN
			list_finish_read:BOOLEAN
			want_to_quit: BOOLEAN
			pair_found: BOOLEAN
			counter: INTEGER
			it: INTEGER
		do
			print("Please choose mode by putting in ADD_EL, ADD_C, RMV_EL, RMV_C, TOPSORT, Ex1, Ex2, Ex3%N")
			print("To finish the program enter END_PROG%N")
			print("ADD_EL - add new elements%N")
			print("ADD_C - add new constraints%N")
			print("RMV_EL - remove elements%N")
			print("RMV_C - remove constraints%N")
			print("TOPSORT - start the topological sort%N")
			print("Ex1 - start example 1%N")
			print("Ex2 - start example 2%N")
			print("Ex3 - start example 3%N")
			print("Ex4 - start example 4%N")
			print("Ex5 - start example 5%N")
			from

			until
				want_to_quit
			loop
				io.read_word
				if
					io.last_string.is_equal ("ADD_EL")
				then
					print("Please enter the elements into the console and finish with FINISH_EL%N")
						-- read line of elements 'a b c d e ...', stop at word FINISH_EL, transfer the elements to an array list
					from
					until all_elements_are_in
					loop
						io.read_word
						if io.last_string.is_equal ("FINISH_EL") then
							print("Entered!%N")
							all_elements_are_in := True
						else
							elements_for_input.extend(io.last_string.twin)
						end
					end
				elseif
					io.last_string.is_equal ("ADD_C")
				then
					print("Please enter the constraints into console and finish with FINISH_C%N")
						-- read line of constraints 'a b c d e ...', stop at word FINISH_C, transfer the elements at the odd position to an array list for the first constraint elements and the elements at the even position to an array list for the second elements
					counter:= 1
					from
					until all_constraints_are_in
					loop
						io.read_word
						if io.last_string.is_equal ("FINISH_C") and counter\\2 = 1 then
							print("Entered!%N")
							all_constraints_are_in := True
						elseif io.last_string.is_equal ("FINISH_C") and counter\\2 = 0 then
							print("Please enter one more constraint element to complete the element pair and end with FINISH_C%N")
						else
							if counter\\2 = 1 then
								constraints_first_element.extend(io.last_string.twin)
							else
								constraints_second_element.extend(io.last_string.twin)
							end
							counter := counter + 1
						end
					end
				elseif
					io.last_string.is_equal("RMV_EL")
				then
					print("Please enter the elements you wish to remove and finish with FINISH_RMV_EL%N")
					from
					until needed_elements_removed
					loop
						io.read_word
						if io.last_string.is_equal ("FINISH_RMV_EL") then
							print("Removed!%N")
							needed_elements_removed := True
						else
							if elements_for_input.has (io.last_string)  then
								elements_for_input.start
								elements_for_input.search (io.last_string)
								elements_for_input.remove
							end
						end

					end
				elseif
					io.last_string.is_equal("RMV_C")
				then
					print("Please enter the constraints you wish to remove and finish with FINISH_RMV_C%N")
					counter:= 1
					from
					until list_finish_read
					loop
						io.read_word
						if io.last_string.is_equal ("FINISH_C") and counter\\2 = 1 then
							print("Entered!%N")
							list_finish_read := True
						elseif io.last_string.is_equal ("FINISH_C") and counter\\2 = 0 then
							print("Please enter one more constraint element to complete the element pair and end with FINISH_RMV_C%N")
						else
							if counter\\2 = 1 then
								constraint_remove_first_element.extend(io.last_string.twin)
							else
								constraint_remove_second_element.extend(io.last_string.twin)
							end
							counter := counter + 1
						end
					end
					constraint_remove_second_element.start
					from
						constraint_remove_first_element.start
					until
						constraint_remove_first_element.after
					loop
						constraints_second_element.start
						from
							constraints_first_element.start
						until
							pair_found OR constraints_first_element.after
						loop
							if constraints_first_element.item.is_equal (constraint_remove_first_element.item) then
								if constraints_second_element.item.is_equal (constraint_remove_second_element.item) then
									constraints_second_element.remove
									constraints_first_element.remove
									pair_found := True
								end
							end
							constraints_second_element.forth
							constraints_first_element.forth
						end
						constraint_remove_second_element.forth
						constraint_remove_first_element.forth
					end
					print("Removed!%N")
				elseif
					io.last_string.is_equal("TOPSORT")
				then
					trf.transfer(elements_for_input, constraints_first_element, constraints_second_element)
					print("Transfer complete!%N")
				elseif
					io.last_string.is_equal("Ex1")
				then
					--Aufruf Ex1
					print("Example 1 started%N")
					trf.run_example (1)
				elseif
					io.last_string.is_equal("Ex2")
				then
					-- Aufruf Ex2
					print("Example 2 started%N")
					trf.run_example (2)

				elseif
					io.last_string.is_equal("Ex3")
				then
					-- Aufruf Ex3
					print("Example 3 started%N")
					trf.run_example (3)

				elseif
					io.last_string.is_equal("Ex4")
				then
					-- Aufruf Ex4
					print("Example 4 started%N")
					trf.run_example (4)

				elseif
					io.last_string.is_equal("Ex5")
				then
					-- Aufruf Ex5
					print("Example 5 started%N")
					trf.run_example (5)

				elseif
					io.last_string.is_equal("END_PROG")
				then
					print("Thank you and Goodbye%N")
					want_to_quit := True
				end
			end
		end

feature{NONE}

	elements_for_input: ARRAYED_LIST[STRING]
	constraints_first_element: ARRAYED_LIST[STRING]
	constraints_second_element: ARRAYED_LIST[STRING]
	constraint_remove_first_element: ARRAYED_LIST[STRING]
	constraint_remove_second_element: ARRAYED_LIST[STRING]

end
