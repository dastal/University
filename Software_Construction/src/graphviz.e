note
	description: "Summary description for {GRAPHVIZ}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPHVIZ[A->HASHABLE]

create
	make

feature

	graph(list: LINKED_LIST[LINKED_LIST[ANY]]; cycles: LINKED_LIST[ANY])
		do
			create_dot_file(list, cycles)
			{EXECUTION_ENVIRONMENT}.launch("%"C:\Program Files (x86)\Graphviz2.38\bin\gvedit.exe%"" + " Dotfile.txt")
		end


	graph_from_package(package: TOPSORTDATAPACKAGE[A])
		require
			package_not_empty : package /= Void
		do
			topsort.package_topsort (package)
			graph(package.get_constraints, topsort.get_cycles)

		end

feature {NONE}

	topsort: TOPSORT[A]

	make

			do
				create topsort.make
			end


	create_dot_string(list: LINKED_LIST[LINKED_LIST[ANY]]; cycles: LINKED_LIST[ANY]): STRING
		-- creates dot string out of the sorted list in the container
		local
			dotstr: STRING

		do
			dotstr := "digraph topsort{"
			if attached list as liste then
				across liste  as el loop
						dotstr := dotstr + el.item.first.out
						dotstr := dotstr + "->"
						dotstr := dotstr + el.item.last.out
						dotstr := dotstr + " "
				end
			end
			if attached cycles as c then
				across c as cc loop
					dotstr := dotstr + cc.item.out +"[color=red, penwidth=4] "
				end
				c.start

			end
			dotstr := dotstr + ";}"
			RESULT:= dotstr

		end


	create_dot_file(list: LINKED_LIST[LINKED_LIST[ANY]]; cycles: LINKED_LIST[ANY])
		-- creates dot file
		local
			dot: PLAIN_TEXT_FILE
		do
			create dot.make_open_write("Dotfile.txt")
			dot.put_string(create_dot_string(list, cycles))
		end
end
