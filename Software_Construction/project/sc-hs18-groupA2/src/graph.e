note
	description: "Summary description for {GRAPH}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPH[G->HASHABLE]

create
	choose_graph

feature

	choose_graph(i:INTEGER; constraint_list: LINKED_LIST[CONSTRAINT]; list:LINKED_LIST[STRING])
		do
			if i = 1 then
				show_graph(constraint_list)
			else
				show_cycle(list)
			end
		end

	show_graph(list: LINKED_LIST[CONSTRAINT])
			-- graphical visualization of topological sort
		local
			file_string: STRING
			output_file: PLAIN_TEXT_FILE  -- other type?
		do
			file_string:=""
				from list.start until list.after loop					-- check output of topological_sort, if compatible etc.
					if list.item = list.first then
						file_string.append ("digraph {%N" + list.first.el_1.name + "->" + list.first.el_2.name+ ";%N")  -- .append??
--						list.forth
					else
						file_string.append (list.item.el_1.name + "->" + list.item.el_2.name + ";%N")			-- check output of topological_sort, if compatible etc. // .append??
--						list.forth
					end
					list.forth
				end
				file_string.append ("}")
				create output_file.make_open_write ("graph.txt")
				output_file.put_string(file_string)
            	output_file.close
				{EXECUTION_ENVIRONMENT}.launch ("%"C:\Program Files (x86)\Graphviz2.38\bin\gvedit.exe%"" + " " + "graph.txt") -- check syntax, especially for second part
		end


	show_cycle(list: LINKED_LIST[STRING])
			-- graphical visualization of the cycle
		local
			file_string: STRING
			output_file: PLAIN_TEXT_FILE  -- other type?
		do
			file_string:=""
				from list.start until list.after loop					-- check output of topological_sort, if compatible etc.
					if list.item = list.first then
						file_string.append ("graph {%N" + list.first)  -- .append??
						list.forth
					else
						file_string.append (" -- " + list.item)			-- check output of topological_sort, if compatible etc. // .append??
						list.forth
					end
				end
				file_string.append (";}")
				create output_file.make_open_write ("cycle.txt")
				output_file.put_string(file_string)
            	output_file.close
				{EXECUTION_ENVIRONMENT}.launch ("%"C:\Program Files (x86)\Graphviz2.38\bin\gvedit.exe%"" + " " + "cycle.txt") -- check syntax, especially for second part
		end
end
