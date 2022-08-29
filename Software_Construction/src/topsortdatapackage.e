note
	description: "Summary description for {TOPSORTDATAPACKAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPSORTDATAPACKAGE[A -> HASHABLE]




create
	make

feature

	make

	do
		create elements.make
		create constraints.make
		create els.make
		create cons.make



	end

feature

	elements: LINKED_LIST[A]
	constraints: LINKED_LIST[LINKED_LIST[A]]

feature {NONE}
	els: LINKED_LIST[A]
	cons: LINKED_LIST[LINKED_LIST[A]]



feature



	get_elements: LINKED_LIST[A]
		require
			elements_exist: elements /= Void

		do
				Result := elements
		end

	get_constraints: LINKED_LIST[LINKED_LIST[A]]
		require
			constraints_exist: constraints /= Void

		do
			RESULT := constraints

		end

	add_element(elem: A)
	require
		con_not_void: elem /= Void
	do
			if attached elements as e then
				e.put_front (elem)
			end
	end

	set_element(elem: LINKED_LIST[A])
	do
		elements := elem

	end

	remove_element(elem: A)
	do

		if attached elements as e then
			e.prune_all (elem)

		end
	end

	print_elements
	do
		print("elements:%N")
	if attached elements as elementos then

			across elementos as e loop
				print(e.item.out+" ")
			end

		end
		print("%N")
	end


	set_constraint(con: LINKED_LIST[LINKED_LIST[A]])
	do
		constraints := con

	end

	add_constraint(con: LINKED_LIST[A])
	require
		con_not_void: con /= Void

	do
		if con.is_empty = FALSE then
			if attached constraints as c then
				c.put_front (con)

			end
		end
	end

	add_constraint_directly(first: A; second: A)
	require
		first_not_empty: first /= Void
		second_not_empty: second /= Void
	local
		c: LINKED_LIST[A]

	do
		create c.make
		c.extend (first)
		c.extend (second)
		if attached constraints as co then
				co.put_front (c)

		end


	end

	remove_constraint (con: LINKED_LIST[A])
	do
		if attached constraints as c then
			from
				c.start
			until
				c.exhausted
			loop
				if c.item.is_equal (con) then
					c.remove
				end
				c.forth
			end
		end
	end

	print_constraints
	do
		print("constraints:%N")

		if attached constraints as con then

			across con as const loop

					print("[ ")
					across const.item as c loop

						print(c.item.out+" ")

					end

					print("]")

			end
		end
		print("%N")
	end
end
