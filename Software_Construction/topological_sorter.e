note
	description: "Summary description for {TOPOLOGICAL_SORTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPOLOGICAL_SORTER[A -> HASHABLE]


create
	make

feature
	make
		do
			create sorted.make
			create candidates.make
			create element_of_index.make_empty
			create index_of_element.make (0)
			create predecessor_count.make_empty
			create successors.make_empty
			create elements.make
			create constraints.make
			create cyclists.make


		end

feature --Internal datastructure

	successors: ARRAY[LINKED_LIST[INTEGER]]
	predecessor_count:ARRAY[INTEGER]
	count: INTEGER
		--Number of elements.	
	index_of_element: HASH_TABLE[INTEGER, A]
		--For every element, gives its index.
	element_of_index: ARRAY[A]
		-- For every assigned index, gives the associated element
	candidates: LINKED_QUEUE[INTEGER]
		-- Elements without predecessors, ready to be released
	processed_count: INTEGER
	elements: LINKED_LIST[A]
	constraints: LINKED_LIST[LINKED_LIST[A]]

--	set_and_sort(package: TOPSORTDATAPACKAGE[A])
		set_and_sort(elems:LINKED_LIST[A]; cons:LINKED_LIST[LINKED_LIST[A]])
		require
--			package_exists: package.get_elements /= Void and package.get_constraints /= Void
			elements_exist: elems /= Void
			constraints_exist:cons/= Void
		do
			elements :=	elems	-- package.get_elements
			constraints := cons		--package.get_constraints
--			count := 0

			across elements as elem loop
				record_element(elem.item)
			end
			across constraints as con loop
				across con as c loop
				record_constraints(c.item.first,c.item.last)
				end
			end
		end





feature --Initialization

	record_element(a:A)
	require
		not_sorted: not done

	do

		if not has_element(a) then

			count := count +1
			index_of_element.put(count, a)
			element_of_index.force(a, count)
			predecessor_count.force (0, count)
			successors.force (create{LINKED_LIST[INTEGER]}.make, count)


		end
--	ensure
----		inserted: has_element(a)
--		one_more: not (old has_element(a)) implies (count = old count + 1)
	end


	record_constraints(b:A ; c:A)
		--Include [a,b] in the constraints.
	require
		not_sorted: not done
		exist: b /= Void and c /= Void
	local
		x,y: INTEGER
	do
		record_element(b); record_element(c)
		x := index_of_element.item (b)
		y := index_of_element.item (c)
		predecessor_count.force (predecessor_count.item (y) + 1, y)
		add_successor (x, y)
--	ensure
--		both_there: has_element(b) = True and has_element(c) = True
	end


	add_successor(x,y: INTEGER)
		-- Record y as successor of x.
	require
		1 <= x ; x <= count
		1 <= y ; y <= count
	local
		x_successors: LINKED_LIST[INTEGER]
	do
		if successors.count >= x then
			x_successors := successors.item (x)

		else
			create x_successors.make
		end
			x_successors.extend (y)
			successors.force (x_successors, x)


	end


feature --Status report
	done: BOOLEAN
		--Hastopological sort been performed?

feature --Element change


	process
		--Perform a topological sort over all applicable elements.
		--Results accessible through sorted, cycles_found and cyclists.

		require
			not_sorted: not done

		local
			x,y: INTEGER
			x_successors: LIST[INTEGER]


		do
			from
				create sorted.make
				find_initial_candidates
				processed_count := 0
			invariant
				-- “The data structures represent a subset of the original elements,
				-- and the corresponding subset of the original relation”
			until
				candidates.is_empty
			loop
				x := candidates.item ; candidates.remove

				sorted.extend (element_of_index.item (x))
				if not successors.item (x).is_empty then


				x_successors := successors.item (x) --A list
--				print("%NHALLIO%N")
				from x_successors.start until x_successors.after loop
					y := x_successors.item
					predecessor_count.force (predecessor_count.item (y) - 1, y)
					if predecessor_count.item (y) = 0 then
						candidates.put(y)

						across candidates as can loop
							print("   " + can.item.out + "  ")
							end
					end
					x_successors.forth
				end

				end
				processed_count := processed_count +1

			variant
				count - processed_count
			end
			report_cycles
			done := True
--			across sorted as sort loop
--			print("  " + sort.item.out + "  ")
--			end



		ensure
			sorted: done

		end

	find_initial_candidates
		--Insert into candidates any elements without predecessors.
		local
			x: INTEGER
		do
			from x := 1 until x > count loop
				if predecessor_count.item (x) = 0 then
					candidates.put(x)
				end
				x := x+1
			end
		end

	report_cycles
		-- Make information about cycles available to clients
		local
			x: INTEGER
		do
			if processed_count < count then
					--There was a cycle in the original relation!
				cycles_found := True
				create {LINKED_LIST[A]}cyclists.make
				from x := 1 until x > count loop
					if predecessor_count [x] /= 0 then
							-- x was involved in a cycle
						cyclists.extend (element_of_index [x])
						x := x + 1
					end
				end
			end
		end

feature --Access

	cycles_found: BOOLEAN
		--Did the original constraint implya cycle?

	cyclists: LINKED_LIST[A]
		--Elements involved in any cycle.

	sorted: LINKED_LIST[A]
		--List, in an order respecting the constraints, of all
		--the elements that can be ordered in that way.

	has_element(el: A): BOOLEAN
		--Is element 'el' one of the elements to be topologically sorted?
		do
			Result := index_of_element.has(el)
			print("%NI'm here%N")
--		ensure
--				Result = index_of_element.has(el) --and then
--				index_of_element.item (el) >= 1-- and then
--				index_of_element.item (el) <= element_of_index.count --and then
--				element_of_index.item (index_of_element.item (el)) = el
		end

	get_cycles: LINKED_LIST[A]

		do
		Result := cyclists.twin
		end

	get_sorted: LINKED_LIST[A]
		do
			Result := sorted.twin
		end

feature --Status setting

	reset
		--Allow further updates of the elements and constraints.
		do
			done := False
			cycles_found := False ; cyclists.wipe_out ; processed_count := 0 ; count := 0
			elements.wipe_out ; constraints.wipe_out ; element_of_index.clear_all ; index_of_element.wipe_out
			successors.clear_all ; predecessor_count.clear_all ; sorted.wipe_out
		ensure
			fresh: not done
		end

invariant
	elements_exist: elements /= Void
	constraints_exist: constraints /= Void
	elements_count: elements.count = count
	successors_count: successors.count = count
--	For every item x of candidates, predecessor_count[x] = 0
--	cyclists_only_if_cycle: done implies(cycles_found = (cyclists /= Void))
end
