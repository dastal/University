note
	description: "Summary description for {TOPOLOGICAL_SORT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TOPOLOGICAL_SORT[G->HASHABLE]

create
	process

feature

	done: BOOLEAN
			-- checks if an action is done
	count: INTEGER
			-- number of elements
	index_of_element: HASH_TABLE [INTEGER, STRING]
			-- For every element, gives its index
	element_of_index: ARRAY [STRING]
			-- For every assigned index, gives the associated element
	successors: ARRAY [LINKED_LIST [INTEGER]]
			-- Indexed by element numbers; for each element x, gives the list of
			-- its successors: the elements y such that there is a constraint [x, y].
	predecessor_count: ARRAY [INTEGER]
			-- Indexed by element numbers; for each, says how many
			-- predecessors the element has.
	candidates: LINKED_PRIORITY_QUEUE [INTEGER]
			-- Elements without predecessors, ready to be released
	cycle_list:LINKED_LIST[STRING]
			-- returns a list of cycle elements
	cycle_found: BOOLEAN
			-- return true when cycle found
	sorted:LINKED_LIST[STRING]
			-- returns the topologically sorted list of elements
	processed_count:INTEGER
			-- counts the precessed elements



feature

	has_element(e:STRING):BOOLEAN
			-- Is e one of the elements to be topologically sorted?
		do
			Result := index_of_element.has (e)
		end

	add_successor(x,y: INTEGER)
			-- y should be noted as successor of x
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

	record_element(e:STRING)
			-- Add e to the set of elements
		do
			if not has_element(e) then
				count := count+1
				index_of_element.put(count,e)
				element_of_index.force(e,count)
				predecessor_count.force (0, count)
				successors.force (create{LINKED_LIST[INTEGER]}.make, count)
			end
		end

	record_constraint(e,f:STRING)
			-- Add the constaint[e,f]
		local
			x,y:INTEGER
		do
			record_element(e); record_element(f)
			x:= index_of_element.item (e)
			y:= index_of_element.item (f)
			predecessor_count.force (predecessor_count.item (y) + 1, y)
			add_successor(x,y)
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
				cycle_found := True
				create {LINKED_LIST[STRING]}cycle_list.make
				from x := 1 until x > count loop
					if predecessor_count.item (x) /= 0 then
							-- x was involved in a cycle
						cycle_list.extend (element_of_index.item (x))
					end
				x := x + 1
				end
			end
		end

	process(elements:LINKED_LIST[ELEMENT]; constraints:LINKED_LIST[CONSTRAINT])
			-- the actual topological sort algorithm
		local
				u,x:INTEGER
				y,z,el:STRING
				x_successors:LINKED_LIST[INTEGER]
				graph: GRAPH[G]
				constraints_for_graph:LINKED_LIST[CONSTRAINT]
		do
			done:=FALSE
			count:=0
			create index_of_element.make (0)
			create element_of_index.make_empty
			create successors.make_empty
			create predecessor_count.make_empty
			create candidates.make
			cycle_found := FALSE
			create cycle_list.make
			create sorted.make
			create x_successors.make
			create constraints_for_graph.make
			constraints_for_graph := constraints
			from
				elements.start
			until
				elements.exhausted
			loop
				el:=elements.item.name
				record_element(el)
				elements.forth
			end
			-- record all constraints
			from
				constraints.start
			until
				constraints.exhausted
			loop
				y:=constraints.item.el_1.name
				z:=constraints.item.el_2.name
				record_constraint(y,z)
				constraints.forth
			end
			from
				create sorted.make
				find_initial_candidates
				processed_count := 0
			invariant
				-- The data structures represent a subset of the original elements,
				-- and the corresponding subset of the original relation
			until
				candidates.is_empty
			loop
					-- Let x be a member of elements with no
					-- predecessor for constraints
				x := candidates.item; candidates.remove
				sorted.extend(element_of_index.item (x))
				if not successors.item (x).is_empty then
					-- Remove x from elements and
					-- all pairs starting with x from constraints
					x_successors := successors.item (x)  -- A list
					from
						x_successors.start
					until
						x_successors.after
					loop
						u := x_successors.item
						predecessor_count.force (predecessor_count.item (u) - 1, u)
						if predecessor_count.item (u) = 0 then
							candidates.put(u)
						end
						x_successors.forth
					end
				end
				processed_count := processed_count+1
			variant
				count-processed_count
			end
			report_cycles
			done:=True
			create graph.choose_graph (1,constraints_for_graph,cycle_list)
			if not cycle_list.is_empty then
				print("A cycle was detected%N")
				create graph.choose_graph (2,constraints_for_graph,cycle_list)
			end
			print("This is the output of the topological sort:%N")
			from sorted.start
			until sorted.after
			loop
				print(sorted.item)
				print("%N")
				sorted.forth
			end
			print("%N")
			print("TOPSORT completed%N")
		end

feature

	reset
			-- reset topological sort so elements and/or constraints can be added/removed
		do
		ensure
			fresh: not done
		end

end
