note
	description: "Summary description for {FACTORY_BASE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	FACTORY_BASE[A]

feature
	get(type: STRING)
		-- Return any factory product with a specific type.
		deferred
		end
end
