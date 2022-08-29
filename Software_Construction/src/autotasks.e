note
	description: "API class for the AutoTasks library: AUTOTASKS. It is able to handle a generic input of type [A]. Therefore the classname is followed by a type parameter section. It is able to create a topsort."
	author: "Joel Watter, Daniel Reiss, Moritz Jenny"
	date: "$Date$"
	revision: "$Revision$"

class
	AUTOTASKS [A->HASHABLE]

create
	make

feature -- Initialization

	example: EXAMPLES
	package: TOPSORTDATAPACKAGE[A]
	visual: GRAPHVIZ[A]
	input_generator: INPUT_GENERATOR
	topsort: TOPSORT[A]
	run_time: RUNTIME[A]

feature {NONE}

	make

		require

		do
			create example.make
			create package.make
			create visual.make
			create input_generator
			create topsort.make
			create run_time.make

		end

feature




end -- class AUTOTASKS

