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

	choose_graph(i:INTEGER; list: LINKED_LIST[STRING])
		do
			if i = 1 then
				show_graph(list)
			else
				show_cycle(list)
			end
		end

	show_graph(list: LINKED_LIST[STRING])
			-- graphical visualization of topological sort
		require
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

--						if list.item = list.last then
--							file_string.append(";%N}")			-- .append??
--							print("%N")
--							list.forth
--						end
					end
				end
				file_string.append (";}")
				create output_file.make_open_write ("graph.txt")
				output_file.put_string(file_string)
            	output_file.close
				{EXECUTION_ENVIRONMENT}.launch ("%"C:\Program Files (x86)\Graphviz2.38\bin\gvedit.exe%"" + " " + "graph.txt") -- check syntax, especially for second part
--			end


		ensure

		end


	show_cycle(list: LINKED_LIST[STRING])
			-- graphical visualization of the cycle
		require
		local
			file_string: STRING
			output_file: PLAIN_TEXT_FILE  -- other type?
			keep_first:STRING --keep the first element of the cycle
		do
			file_string:=""
			keep_first := list.first
				from list.start until list.after loop					-- check output of topological_sort, if compatible etc.
					if list.item = list.first then
						file_string.append ("graph {%N" + list.first)  -- .append??
						list.forth
					else
						file_string.append (" -- " + list.item)			-- check output of topological_sort, if compatible etc. // .append??
						list.forth

--						if list.item = list.last then
--							file_string.append(";%N}")			-- .append??
--							print("%N")
--							list.forth
--						end
					end
				end
				file_string.append (" -- ")
				file_string.append (keep_first)
				file_string.append (";}")
				create output_file.make_open_write ("cycle.txt")
				output_file.put_string(file_string)
            	output_file.close
				{EXECUTION_ENVIRONMENT}.launch ("%"C:\Program Files (x86)\Graphviz2.38\bin\gvedit.exe%"" + " " + "cycle.txt") -- check syntax, especially for second part
--			end


		ensure

		end
end
