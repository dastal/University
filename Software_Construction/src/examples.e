note
	description: "Summary description for {EXAMPLES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXAMPLES

create
	make

feature {NONE}

	topsort: TOPSORT[STRING]
	elements: LINKED_LIST[STRING]
	constraints: LINKED_LIST[LINKED_LIST[STRING]]
	g: GRAPHFACTORY[STRING]

	make

		do
			create topsort.make
			create elements.make
			create constraints.make
			create g.make (constraints, topsort.get_cycles)
			create package.make
		end






feature
	package: TOPSORTDATAPACKAGE[STRING]

	run_rosetta(cycle: BOOLEAN; graph: BOOLEAN)
		do
			package.set_constraint (rosetta_constraints(cycle))
			package.set_element (rosetta_elements)
			topsort.topsort(package.get_elements, package.get_constraints)
			if graph then
				g.make(package.get_constraints, topsort.get_cycles)
				g.get("GRAPHVIZ")
			end
		end

	run_make_file(filename: STRING; graph: BOOLEAN)
		do
			package.set_constraint (read_make_file(filename))
			package.set_element (elements_from_constraints(package.get_constraints))
			topsort.topsort (package.get_elements, package.get_constraints)
			if graph then
				g.make(package.get_constraints, topsort.get_cycles)
				g.get("GRAPHVIZ")
			end
		end


feature {NONE}



	rosetta_elements: LINKED_LIST[STRING]

		local

		do
			create elements.make
			elements.put_front ("des_system_lib")
			elements.put_front ("dw01")
			elements.put_front ("dw02")
			elements.put_front ("dw03")
			elements.put_front ("dw04")
			elements.put_front ("dw05")
			elements.put_front ("dw06")
			elements.put_front ("dw07")
			elements.put_front ("dware")
			elements.put_front ("gtech")
			elements.put_front ("ramlib")
			elements.put_front ("std_cell_lib")
			elements.put_front ("synopsis")
			elements.put_front ("ieee")
			elements.put_front ("std")

			RESULT := elements
		end

	rosetta_constraints(cycles: BOOLEAN): LINKED_LIST[LINKED_LIST[STRING]]
		local
			con: LINKED_LIST[STRING]
		do
			create constraints.make
			create con.make

			if cycles then
				con.extend ("dw01")
				con.extend ("dw04")
				constraints.put_front (con.twin)
				con.wipe_out
			end

			con.extend ("des_system_lib")
			con.extend ("std")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("synopsis")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("std_cell_lib")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("des_system_lib")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("dw02")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("dw01")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("ramlib")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("des_system_lib")
			con.extend ("std")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw01")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw01")
			con.extend ("dw01")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw01")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw01")
			con.extend ("gtech")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw02")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw02")
			con.extend ("dw02")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw02")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("std")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("synopsis")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("dw03")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("dw02")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("dw01")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw03")
			con.extend ("gtech")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw04")
			con.extend ("dw04")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw04")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw04")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw04")
			con.extend ("gtech")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw05")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw05")
			con.extend ("dw05")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw05")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw06")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw06")
			con.extend ("dw06")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw06")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw07")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw07")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dware")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dware")
			con.extend ("dware")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("gtech")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("gtech")
			con.extend ("gtech")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("ramlib")
			con.extend ("std")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("ramlib")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("std_cell_lib")
			con.extend ("ieee")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("std_cell_lib")
			con.extend ("std_cell_lib")
			constraints.put_front (con.twin)
			con.wipe_out
			con.extend ("dw04")
			con.extend ("dw01")
			constraints.put_front (con.twin)
			con.wipe_out


			RESULT := constraints
		end


	read_make_file (filename: STRING) : LINKED_LIST[LINKED_LIST[STRING]]
		local
			file: PLAIN_TEXT_FILE
			el1: STRING
			el2: STRING
			con: LINKED_LIST[STRING]
			cons: LINKED_LIST[LINKED_LIST[STRING]]
			first: STRING
			is_first: BOOLEAN



		do
			create file.make_open_read (filename)
			create el1.make (1024)
			create el2.make (1024)
			create cons.make

			cons.wipe_out


			from

			until
				file.exhausted
			loop
				create con.make
				file.read_line
				is_first := TRUE
				el1.wipe_out
				if attached con as c then
					con.wipe_out
				end

				across file.last_string as chunk loop
					if chunk.item.out.is_equal (" ") = FALSE then
						if is_first = TRUE then
							if chunk.item.out.is_equal (":") = FALSE then
								el1.extend (chunk.item)
							end
						end

					end
					if chunk.item.out.is_equal (":") then
						is_first := FALSE
						con.extend (el1.twin)
					end
					if chunk.item.out.is_equal (":") = FALSE then
						if is_first = FALSE then
							if chunk.item.out.is_equal (" ") = FALSE then

								el2.extend (chunk.item)

							end
						end
					end
					if chunk.item.out.is_equal (" ") or chunk.is_last then
						if el2.out.is_empty = FALSE then
							if is_first = FALSE then
								con.extend (el2.twin)
								if attached cons as conss then
									conss.extend (con.twin)
								end
								el2.wipe_out
								con.wipe_out
								con.extend (el1.twin)
							end
						end

					end
				end
			end
			file.close
			RESULT:= cons
		end

	elements_from_constraints(con: LINKED_LIST[LINKED_LIST[STRING]]) :  LINKED_LIST [STRING]

	local
		list: LINKED_LIST[STRING]
		contained: BOOLEAN

	do
		create list.make




		if attached con as c then
			c.start
			across c as cc loop
				if attached list as l then
					from
						l.start
					until
						l.exhausted
					loop
						if cc.item.first.is_equal(l.item) then

							contained := TRUE
							l.finish
						end
						l.forth

					end

						if contained = FALSE then
							l.extend (cc.item.first)
						else
							contained := FALSE
						end

				end
			end
			across c as cc loop
				c.start
				if attached list as l then
					from
						l.start
					until
						l.exhausted
					loop
						if cc.item.last.is_equal(l.item) then

							contained := TRUE
							l.finish
						end
						l.forth

					end

						if contained = FALSE then
							l.extend (cc.item.last)
						else
							contained := FALSE
						end

				end
			end

		end

		RESULT:= list
	end

end
