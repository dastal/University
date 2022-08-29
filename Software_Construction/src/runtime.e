note
	description: "Summary description for {RUNTIME}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	RUNTIME[A->HASHABLE]

create
	make

feature {NONE}

	package: TOPSORTDATAPACKAGE[INTEGER]
	gen: INPUT_GENERATOR
	top: TOPSORT[INTEGER]

	make
		do
			create package.make
			create gen
			create top.make
			create start_time.make_now
			create end_time.make_now

		end



feature


	run_with_10_constraints

		do
			gen.generate_int_package (package, 10, 42)
			start_time.make_now
			top.package_topsort (package)
			end_time.make_now

			time_difference
			print(last_execution_time)

		end

	run_with_1000_constraints

		do
			gen.generate_int_package (package, 1000, 42)
			start_time.make_now
			top.package_topsort (package)
			end_time.make_now

			time_difference
			print(last_execution_time)

		end

	run_with_100000_constraints

		do
			gen.generate_int_package (package, 100000, 42)
			start_time.make_now
			top.package_topsort (package)
			end_time.make_now

			time_difference
			print(last_execution_time)

		end

feature
	start_time: TIME
	end_time: TIME
	execution_time: REAL_64


	last_execution_time: REAL_64
			-- Gets last execution time
		do
			RESULT := execution_time
		end



	time_difference
			-- Calculate time difference
		require
			start_time_exists: start_time /= Void
			end_time_exists: end_time /= Void
		do
			execution_time := end_time.relative_duration (start_time).fine_second
		end

end
