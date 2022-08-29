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

feature

	process(elements:LINKED_LIST[ELEM], constraints:LINKED_LIST[CONSTR])
			-- the actual topological sort algorithm
		require
			not_sorted: not done
		do
		ensure
			sorted: done
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
