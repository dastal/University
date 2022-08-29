note
	description: "topsort_project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature  -- Initialization

start: INPUT_HANDLER[INTEGER]


feature --Routines
	make
		do
			create start.input_start
		end


end

