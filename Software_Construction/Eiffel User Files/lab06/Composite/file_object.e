note
	description: "Component of the Composite Design Pattern."
	author: "Anna Jancso"

deferred class
	FILE_OBJECT

feature -- Access

	name: STRING
		-- Name

	size: INTEGER
		-- Size in bytes
		deferred
		end
		
feature -- Check

	has_illegal_chars(a_name: STRING): BOOLEAN
		-- Does `a_name' contain forward slashes?
		do
			Result := a_name.has ('/')
		end

invariant
	non_empty_name: not name.is_empty
	no_illegal_chars: not has_illegal_chars(name)
	non_negative_size: size >= 0

end



