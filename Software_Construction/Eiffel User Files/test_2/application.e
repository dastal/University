note
	description: "Summary description for {TOPOLOGICAL_SORTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPOLOGICAL_SORTER[G->HASHABLE]

feature

	done: BOOLEAN
			-- checks if an action is done

	count: INTEGER
			-- number of elements

	index_of_element: HASH_TABLE [INTEGER, ELEM]
			-- For every element, gives its index

	element_of_index: ARRAY [ELEM]
			-- For every assigned index, gives the associated element

	successors: ARRAY [LINKED_LIST [INTEGER]]
			-- Indexed by element numbers; for each element x, gives the list of
			-- its successors: the elements y such that there is a constraint [x, y].

	predecessor_count: ARRAY [INTEGER]
			-- Indexed by element numbers; for each, says how many
			-- predecessors the element has.

	candidates: PRIORITY_QUEUE [INTEGER]
			-- Elements without predecessors, ready to be released


feature

	has_element(e:ELEM):BOOLEAN
			-- Is e one of the elements to be topologically sorted?

		do
			Result := index_of_elements.has(e)
		ensure
			consistent: Result = index_of_elements.has(e) and then
				index_of_element[e] >= 1 and then
				index_of_element[e] <= element_of_index.count and then
				element_of_index[index_of_element[e]] = e
		end

	add_successor(x,y: INTEGER)

		require
			1 <= x; x <= count
			1 <= y; y <= count
		local
			x_successors: LINKED_LIST[INTEGER]
		do
			x_successors := successors[x]
				-- In cas successor list for x has not been created yet
			if x_successors = Void then
				create x_successors.make
				successors[x] := x_successors
			end
			x_successors.enxtend(y)
		end

	record_element(e:ELEM)
			-- Add e to the set of elements
		require
			not_sorted: not done
		do
			if not has_element(e) then
				count := count+1
				index_of_element.extend(count,e)
				element_of_index.force(e,count)
			end
		ensure
			inserted: has_element(e)
			one_more: not(old has_element(e)) implies (count = old count + 1)
		end

	record_constraint(e,f:ELEM)
			-- Add the constaint[e,f]
		require
			not_sorted: not done
			exist: e/=Void and f/=Void
		local
			x,y:INTEGER
		do
			record_element(e); record_element(f)
			x:= index_of_element[e]
			y:= index_of_element[f]
			predecessor_count[y] := predecessor_count[y] + 1
			add_successor(x,y)
		ensure
			both_there: has_element(e) and has_element(f)
		end

	process(elements:LINKED_LIST[ELEM], constraints:LINKED_LIST[CONSTR])
			-- the actual topological sort algorithm
		require
			not_sorted: not done

			-- record all elements
		do
			from
				elements.start
			until
				elements.exhausted
			loop
				record_element(elements.item)
				elements.forth
			end
		end

			-- record all constraints
		local
			x,y:INTEGER
		do
			from
				constraints.start
			until
				constraints.exhausted
			loop
				x:=constraints.item[1]
				y:=constraints.item[2]
				record_constraint(x,y)
				constraints.forth
			end
		end

		do
			from
				create sorted.make
				local
					x:INTEGER
						-- insert into candidates any elements without predecessor
				do
					if candidates = Void then create candidates end
					from
						x:=1
					until
						x>count
					loop
						if predecessor_count[x]=0 then candidates.put(x) end
						x := x+1
					end
				end
			invariant
				-- The data structures represent a subset of the original elements,
				-- and the corresponding subset of the original relation
			until
				candidates.is_empty
			loop
					-- Let x be a member of elements with no
					-- predecessor for constraints
				x := candidates.item; candidates.remove
				sorted.extend(element_of_index[x])
					-- Remove x from elements and
					-- all pairs starting with x from constraints
				x_successors := successors[x]  -- A list
				from
					x_successors.start
				until
					x_successors.after
				loop
					y := x_successors.item
					predecessor_count[y] := predecessor_count[y]-1
					if predecessor_count[y] = 0 then
						-- “Record that y is now without predecessors”
						candidates.put(y)
					end
					x_successors.forth
				end
				processed_count := processed_count+1
			variant
				count-processed_count
			end
				-- report_cycles
				-- Make information about cycles available to clients
			do
				if processed_count<count then
					cylce_found := True
						-- There was a cycle found
					create {LINKED_LIST[ELEM]}cycle_list.make
					from
						x:=1
					until
						x>count
					loop
						if predecessor_count[x]/=0 then
							cycle_list.extend(element_of_index[x])
							x:= x+1
						end
					end
				end
			done:=True
		end

feature

	cycle_found: BOOLEAN
			-- returns TRUE if cycle is found

	cycle_list:LINKED_LIST[ELEM]
			-- returns a list of cycle elements

	sorted:LINKED_LIST[ELEM]
			-- returns the topologically sorted list of elements

feature

	show_cycle()
			-- graphical visualization of the cycle
		require

		do

		ensure

		end

	reset
			-- reset topological sort so elements and/or constraints can be added/removed
		do
		ensure
			fresh: not done
		end

end
