note
	description: "project application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION


inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make


		local
			autotasks: AUTOTASKS[INTEGER]
		do
			create autotasks.make




--			autotasks.input_generator.generate_int_package (autotasks.package, 15, 3)
--			autotasks.topsort.package_topsort (autotasks.package)
--			autotasks.visual.graph_from_package (autotasks.package)

			autotasks.run_time.run_with_10_constraints













		end

end
