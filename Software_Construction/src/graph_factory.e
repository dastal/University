note
	description: "Summary description for {GRAPHFACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GRAPHFACTORY[A->HASHABLE]
inherit
	FACTORY_BASE[A]
		redefine
			get
		end
create
	make

feature
	constraints: LINKED_LIST[LINKED_LIST[A]]
	cycles: LINKED_LIST[A]

feature
	make(list: LINKED_LIST[LINKED_LIST[A]]; cycles_list: LINKED_LIST[A])


		do
			create constraints.make
			create cycles.make
			constraints := list
			cycles := cycles_list
		end

feature --Routines
	get(type: STRING)
	local
		graphviz: GRAPHVIZ[A]

			-- expendable for any kind of graphical output production class
	do
		if type.is_equal ("GRAPHVIZ") then
			create graphviz.make
			graphviz.graph (constraints, cycles)
		else		--By adding more elseif statements, more procedures for grafical output could be added and call over this factory. With this in the calling class only one instance is needed to produce diffrent outputs.
			{EXCEPTIONS}.raise ("Enter the correct class name for the production")
		end
	end
end
