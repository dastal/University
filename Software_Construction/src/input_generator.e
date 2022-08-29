note
	description: "Summary description for {INPUT_GENERATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	INPUT_GENERATOR

feature {NONE}

	constraint:  LINKED_LIST[ LINKED_LIST[INTEGER]]
		attribute
            			create Result.make
       	end

	element:  LINKED_LIST [INTEGER]
	attribute
            			create Result.make
     end


feature

	generate_int_package(package: TOPSORTDATAPACKAGE[INTEGER] size:INTEGER ; seed:INTEGER)

	require
		package_not_empty: package /= Void
		size_is_valid: size >= 0


	local
		cons: LINKED_LIST[LINKED_LIST[INTEGER]]
		el: LINKED_LIST[INTEGER]

	do
		cons := random_constraint_generator(size, seed)
		el := elements_from_constraints(cons)



		package.set_constraint (cons)
		package.set_element (el)


	end

feature {NONE}

	random_constraint_generator(size:INTEGER; seed:INTEGER):  LINKED_LIST[LINKED_LIST[INTEGER]]

	local
			size_of_constraint: INTEGER
			someseed: INTEGER
			size_of_one_constraint: INTEGER
			local_generator: RANDOM
			randnumber: REAL
			randin: INTEGER
			count: INTEGER
			length: INTEGER

	do
				length := 2
				size_of_constraint:=size + 2
				size_of_one_constraint:=length
				someseed:= seed

				create local_generator.set_seed (someseed)
				create constraint.make

				from
					local_generator.start
				until
				size_of_constraint = 0
				loop

					randnumber := local_generator.real_item
					if attached constraint as const then
						const.put_front(create {LINKED_LIST[INTEGER]}.make)
						const.start
--						count := 0
						from
							count := 0
						until
							count = size_of_one_constraint
						loop

							randin := ((randnumber * 10000).floor\\(size_of_one_constraint * size_of_constraint)+1)
							if not const.item.has (randin) then
								const.item.put_front(randin)
								count := count + 1
							end

							local_generator.forth
							randnumber := local_generator.real_item

						end
						local_generator.forth
						size_of_constraint:=size_of_constraint-1
					end
				end
				constraint.start
				constraint.remove
				constraint.remove
				RESULT:= constraint

	end


	elements_from_constraints(con: LINKED_LIST[LINKED_LIST[INTEGER]]) :  LINKED_LIST [INTEGER]

	local
		list: LINKED_LIST[INTEGER]
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
