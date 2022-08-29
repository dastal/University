note
	description: "Summary description for {TOPSORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPSORT[A -> HASHABLE]

create
	make

feature {NONE}
	make

	do
		create sorted_list.make
		create circle.make
	end

feature

	sorted_list: LINKED_LIST[A]
	circle: LINKED_LIST[A]

feature

	package_topsort(package: TOPSORTDATAPACKAGE[A])

		do
			if attached package as p then
				topsort(p.get_elements, p.get_constraints)
			end
		end


	topsort(input_elements: LINKED_LIST[A]; input_constraints:  LINKED_LIST[LINKED_LIST[A]])

	require
		elements_exist: input_elements /= Void
		constraints_exist: input_constraints /= Void

	local
		constraints: LINKED_LIST[LINKED_LIST[A]]
		constraints_copy: LINKED_LIST[LINKED_LIST[A]]
		next: LINKED_LIST[A]
		next_copy: LINKED_LIST[A]
		results: LINKED_LIST[A]
		neighbour: LINKED_LIST[A]
		neighbours_copy: detachable LINKED_LIST[A]
		cycles: LINKED_LIST[A]
		contained: BOOLEAN

	do
		create constraints.make
		create constraints_copy.make
		create next.make
		create next_copy.make
		create results.make
		create neighbour.make
		create neighbours_copy.make
		create cycles.make

		constraints := input_constraints.twin

		next := input_elements.twin

		constraints_copy := constraints

		constraints.start

		from
			constraints.start
		until
			constraints.exhausted
		loop

			if constraints.item.first.is_equal(constraints.item.last) then
		--		print("removed node from "+constraints.item.first.out + " to " +constraints.item.last.out+ " because node it points on itself%N")
				constraints_copy.prune (constraints.item)
				constraints_copy.back
			end
			constraints.forth
		end

		constraints.start

		from
			constraints.start
		until
			constraints.exhausted
		loop
			across input_elements as element loop

				if constraints.item.last.is_equal(element.item) then
					contained := TRUE
				end
			end

			if contained = FALSE then
			--	print("removed node from "+constraints.item.first.out + " to " +constraints.item.last.out+ " because no element is = "+constraints.item.last.out+"%N")
				constraints_copy.prune(constraints.item)
				constraints_copy.back
			else
				contained := FALSE
			end

			input_elements.start
			constraints.forth
		end

	--	print_copys(constraints)

		constraints.start

		from
			constraints.start
		until
			constraints.exhausted
		loop
			across input_elements as element loop
				if constraints.item.first.is_equal(element.item) then
					contained := TRUE
				end
			end

			if contained = FALSE then
			--	print("removed node from "+constraints.item.first.out + " to " +constraints.item.last.out+ " because no element is = "+constraints.item.first.out+"%N")
				constraints_copy.prune(constraints.item)
				constraints_copy.back
			else
				contained := FALSE
			end

			input_elements.start
			constraints.forth
		end

	--	print_copys(constraints)
		constraints.start

		from
			constraints.start
		until
			constraints.exhausted
		loop -- the "next" list gets updated -> contains all the elements which have no icoming edges
			across input_elements as element loop
				if constraints.item.last.is_equal(element.item) then
					next.start
					next.prune (element.item)
					next.start
				end
			end
			constraints.forth
		end

		constraints.start
		next_copy := next

	--	print_next(next_copy)

		from

		until
			next_copy.is_empty = TRUE
		loop
		--	print("current node is: "+next_copy.first.out+"%N")
			across constraints as constraint loop
				if constraint.item.first.is_equal(next_copy.item) then
					across constraints as constraint_2 loop
						if constraint.item.first.is_equal(constraint_2.item.first) = FALSE then -- do elements have other incoming nodes?
							if constraint.item.last.is_equal (constraint_2.item.last) then
								contained := TRUE
							end
						end
					end
					across next as nex loop
						if nex.item.is_equal(constraint.item.last) then
							contained := TRUE
						end
					end
					if contained = FALSE then
						next_copy.extend (constraint.item.last) --extend next_copy with valid elements
					--	print ("extended nextcopy with "+ constraint.item.last.out + " <- this%N")
					else
						contained := FALSE
					end
				end
			end

			constraints_copy.start
			from
				constraints_copy.start
			until
				constraints_copy.exhausted
			loop
				if constraints_copy.item.first.is_equal(next_copy.item) then
				--	print("removed "+constraints_copy.item.first.out+ ", "+constraints_copy.item.last.out+ " from constraints%N")
					constraints.prune (constraints_copy.item)
					constraints.back
				end
				constraints_copy.forth
			end
		--	print("updated ")
		--	print_copys(constraints_copy)

			next_copy.start

			results.extend (next_copy.item) -- add first "next" item to the resuts and remove from next
		--	print("added "+ next_copy.item.out + " to the results%N")
			next_copy.remove
		--	print_next(next_copy)
		end

		across input_elements as element loop
			across results as res loop
				if element.item.is_equal(res.item) then
					contained := TRUE
				end
			end
			if contained = FALSE then
				cycles.extend (element.item)
			else
				contained := FALSE
			end
		end
		print("%Nresults ")
		print_next(results)
		sorted_list := results

		print("%Ncycles ")
		print_next(cycles)
		circle := cycles

		ensure
			results_exist: sorted_list /= Void

	end

	print_next(list: LINKED_LIST[A])
	do
		print("list:%N")
	if attached list as elementos then

			across elementos as e loop
				print(e.item.out+" ")
			end

		end
		print("%N")
	end

	print_copys(cons: LINKED_LIST[LINKED_LIST[A]])
	do
		print("constraints:%N")

	if attached cons as con then
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

	get_cycles : LINKED_LIST[A]
    	do
        	RESULT := circle
    	end
end
