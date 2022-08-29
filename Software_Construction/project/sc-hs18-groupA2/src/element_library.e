note
	description: "Summary description for {ELEMENT_LIBRARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ELEMENT_LIBRARY[G->HASHABLE]

inherit
	ANY

create
	ele_lib

feature

	ele_lib
		--Create empty elements and constraints lists
		do
			create all_elements.make
			create all_constraints.make
			create input_element.make(50)
			create input_constraint_first.make(50)
			create input_constraint_second.make(50)
			create constraints_found.make
		end

feature


	transfer(an_element_list: ARRAYED_LIST[STRING]; a_constraint_first_list: ARRAYED_LIST[STRING]; a_constraint_second_list: ARRAYED_LIST[STRING])
			-- transfer the user input from INPUT_HANDLER to ELEMENT_LIBRARY
		require
			element_list_not_empty: not an_element_list.is_empty
		local
			top_sort: TOPOLOGICAL_SORT[G]
		do
			input_element := an_element_list
			input_constraint_first := a_constraint_first_list
			input_constraint_second := a_constraint_second_list
			add_elements_input(input_element)
			add_constraints_input(input_constraint_first, input_constraint_second)
			create top_sort.process(all_elements, all_constraints)
		ensure
			elment_list_is_equal: input_element = an_element_list
			constraint_list_first_element_is_equal: input_constraint_first = a_constraint_first_list
			constraint_list_second_element_is_equal: input_constraint_second = a_constraint_second_list
		end

	add_element(an_element:ELEMENT)
			-- add an element to the all_elements list
		require
			element_not_in_list: not element_in_list(an_element)
		do
			all_elements.extend(an_element)
		ensure
			one_element_more: all_elements.count = old all_elements.count + 1
			element_added: all_elements.last = an_element
		end


	add_constraint(a_constraint: CONSTRAINT)
			-- add constraint to the all_constraints list
		require
			--constraint_not_in_list: not constraint_in_list(a_constraint)
			element_1_exists: element_in_list(a_constraint.el_1)
			element_2_exists: element_in_list(a_constraint.el_2)
		do
			if a_constraint.el_1.name.is_equal (a_constraint.el_2.name) then

			else
				all_constraints.extend(a_constraint)
			end
		end


	list_index: INTEGER

	add_elements_input(some_elements:ARRAYED_LIST[STRING])
		require
			input_list_not_empty: not some_elements.is_empty
		local
			ele: ELEMENT
		do
			across some_elements as se
				loop
					create ele.make(se.item)
					add_element(ele)
				end
		ensure
			equal_or_more_elements: all_elements.count >= old all_elements.count and all_elements.count <= old all_elements.count + some_elements.count
		end

	add_constraints_input(left_side:ARRAYED_LIST[STRING]; right_side:ARRAYED_LIST[STRING])
		require
			input_list1_not_empty: not left_side.is_empty
			input_list2_not_empty: not right_side.is_empty
		local
			const: CONSTRAINT
			ele1: ELEMENT
			ele2: ELEMENT
		do
			from left_side.start until left_side.after
				loop
					list_index := left_side.index
					create ele1.make(left_side.item)
					create ele2.make(right_side.i_th(list_index))
					create const.make(ele1, ele2)
					add_constraint(const)
					left_side.forth
				end
		ensure
			equal_or_more_constraints: all_constraints.count >= old all_constraints.count and all_constraints.count <= old all_constraints.count + left_side.count
		end

	i:	INTEGER

	loop_elements(amount:INTEGER)
			-- creates <amount> elements (used for examples and testing)
		local
			ele: ELEMENT
		do
			from i:=0 until i = amount
				loop
					create ele.make(i.out)
					add_element(ele)
					i:=i+1
				end
		ensure
			correct_amount: all_elements.count = amount
		end

	loop_constraints(amount: INTEGER; elem_amount:INTEGER)
			-- creates <amount> of constraints with elements in <input>
		local
			x: INTEGER
			r1: RANDOM
			r2: RANDOM
			ele1_index:INTEGER
			ele2_index:INTEGER
			ele1: ELEMENT
			ele2: ELEMENT
			const: CONSTRAINT
		do
        		create r1.set_seed (1) -- ... is the initial "seed"
        		r1.start
        		create r2.set_seed (1) -- ... is the initial "seed"
        		r2.start
    		across
        		1 |..| amount as randomizer
    		from x := 1 until x > amount
    		loop
    			ele1_index := (r1.item\\elem_amount)
    			ele2_index := (r2.item\\elem_amount)
    			if ele1_index = 0 then
    				ele1_index := ele1_index + 1
    			end
    			if ele1_index > elem_amount-2 then
    				ele1_index := ele1_index - 1
    			end
    			if ele2_index = 0 then
    				ele2_index := ele2_index + 1
    			end
    			if ele1_index > elem_amount-2 then
    				ele1_index := ele1_index - 1
    			end
    			ele1 := all_elements.i_th (ele1_index)
    			ele2 := all_elements.i_th (ele2_index)
    			create const.make (ele1, ele2)
				add_constraint(const)
				i := i+1
       			r1.forth
        		r2.forth
    		end
		end

	example_1
			-- rosetta code
		local
			ele: ELEMENT
			const: CONSTRAINT
			ele1: ELEMENT
			ele2: ELEMENT
			top_sort: TOPOLOGICAL_SORT[G]
		do

			create ele.make("des_system_lib")
			add_element(ele)

			create ele.make("std")
			add_element(ele)

			create ele.make("synopsys")
			add_element(ele)

			create ele.make("std_cell_lib")
			add_element(ele)

			create ele.make("ieee")
			add_element(ele)

			create ele.make("dw01")
			add_element(ele)

			create ele.make("dw02")
			add_element(ele)

			create ele.make("dw03")
			add_element(ele)

			create ele.make("dw04")
			add_element(ele)

			create ele.make("dw05")
			add_element(ele)

			create ele.make("dw06")
			add_element(ele)

			create ele.make("dw07")
			add_element(ele)

			create ele.make("dware")
			add_element(ele)

			create ele.make("gtech")
			add_element(ele)

			create ele.make("ramlib")
			add_element(ele)

			create ele1.make("des_system_lib")
			create ele2.make("std")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("synopsys")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("std_cell_lib")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("des_system_lib")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("dw02")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("dw01")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("des_system_lib")
			create ele2.make("ramlib")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw01")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw01")
			create ele2.make("dw01")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw01")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw01")
			create ele2.make("gtech")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw02")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw02")
			create ele2.make("dw02")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw02")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("std")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("synopsys")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("dw03")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("dw02")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("dw01")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw03")
			create ele2.make("gtech")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw04")
			create ele2.make("dw04")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw04")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw04")
			create ele2.make("dw01")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw04")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw04")
			create ele2.make("gtech")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw05")
			create ele2.make("dw05")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw05")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw05")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw06")
			create ele2.make("dw06")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw06")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw06")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw07")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dw07")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dware")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("dware")
			create ele2.make("dware")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("gtech")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("gtech")
			create ele2.make("gtech")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("ramlib")
			create ele2.make("std")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("ramlib")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("std_cell_lib")
			create ele2.make("ieee")
			create const.make(ele1, ele2)
			add_constraint(const)

			create ele1.make("std_cell_lib")
			create ele2.make("std_cell_lib")
			create const.make(ele1, ele2)
			add_constraint(const)

			create top_sort.process(all_elements, all_constraints)
			print("Ex1 completed%N")

		end

	example_2(filename:STRING)
			-- read file
		local
			input_file: PLAIN_TEXT_FILE
			el1: STRING
			el2: STRING
			con: LINKED_LIST[STRING]
			cons: LINKED_LIST[LINKED_LIST[STRING]]
			is_first: BOOLEAN
		do
			create input_file.make_open_read(filename)
			create el1.make(1024)
			create el2.make(1024)
			create cons.make
			cons.wipe_out

			from
			until
				input_file.exhausted
			loop
				create con.make
				input_file.read_line
				is_first := TRUE
				el1.wipe_out
				if attached con as c then
					con.wipe_out
				end

				across input_file.last_string as chunk loop
					if chunk.item.out.is_equal (" ") = FALSE then
						if is_first = TRUE then
							if chunk.item.out.is_equal (":") = FALSE then
								el1.extend(chunk.item)
							end
						end
					end
					if chunk.item.out.is_equal (":") then
						is_first := FALSE
						con.extend(el1.twin)
					end
					if chunk.item.out.is_equal (":") = FALSE then
						if is_first = FALSE then
							if chunk.item.out.is_equal (" ") = FALSE then
								el2.extend(chunk.item)
							end
						end
					end
					if chunk.item.out.is_equal (" ") or chunk.is_last then
						if el2.out.is_empty = FALSE then
							con.extend(el2.twin)
							if attached cons as conss then
								conss.extend(con.twin)
							end
							el2.wipe_out
							con.wipe_out
							con.extend(el1.twin)
							end
						end
					end
				end
			input_file.close
			print_copys(cons)
			end
			print_copys(cons: LINKED_LIST[LINKED_LIST[STRING]])
			do
				print("constraints:%N")

			if attached cons as con then
				across con as co loop
					print("[ ")
					across co.item as c loop
						print(c.item.out+" ")
					end
					print("]%N")
				end
			end
			print("Ex2 completed%N")
		end

	run_example(number: INTEGER)
			-- run the respective example
		require
			number>=1 and number<=5
		local
			topsort: TOPOLOGICAL_SORT[G]
		do
			if number = 1 then
				example_1 --example_1
			elseif number = 2 then example_2("Example_2.txt")
			elseif number = 3 then
				loop_elements(4)
				loop_constraints(10,4)
				create topsort.process (all_elements, all_constraints)
			elseif number = 4 then
				loop_elements(200)
				loop_constraints(1000,200)
				create topsort.process (all_elements, all_constraints)
			else
				loop_elements(2000)
				loop_constraints(100000,2000)
				create topsort.process (all_elements, all_constraints)
			end
		end

feature {NONE}

	all_elements: LINKED_LIST[ELEMENT]
		-- list of all elements
	all_constraints: LINKED_LIST[CONSTRAINT]
		-- list of all constraints
	constraints_found: LINKED_LIST[CONSTRAINT]
		-- constraints with special elements
	amount_found: INTEGER
	input_element: ARRAYED_LIST[STRING]
		-- list of user element inputs
	input_constraint_first: ARRAYED_LIST[STRING]
		-- list of user input for the first constraint element
	input_constraint_second: ARRAYED_LIST[STRING]
		-- list of user input for the second constraint element
feature

	element_in_list(some_element: ELEMENT): BOOLEAN
		-- Check if the elements are in the elements list
	local
		is_element_in: BOOLEAN
	do
		from
			all_elements.start
		until
			is_element_in = True OR all_elements.after
		loop
			is_element_in := all_elements.item.name.is_equal(some_element.name)
			all_elements.forth
		end
		Result := is_element_in
	end

	constraint_in_list(some_constraint: CONSTRAINT): BOOLEAN
		-- Check if the contains are in the constraints list
	local
		is_constraint_in: BOOLEAN
	do
		from
			all_constraints.start
		until
			is_constraint_in = True OR all_constraints.after
		loop
			is_constraint_in := all_constraints.item.el_1.name.is_equal(some_constraint.el_1.name) AND all_constraints.item.el_2.name.is_equal(some_constraint.el_2.name)
		end
		Result := is_constraint_in
	end
end
