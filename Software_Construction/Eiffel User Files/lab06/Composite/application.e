note
	description: "Root class showcasing the Composite Design Pattern."
	author: "Anna Jancso"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			repo, documents, tests, src: FO_FOLDER
			requirements, design, testplan, readme: FO_FILE
		do
			-- Create the folders
			create repo.make ("sc-hs18-groupX")
			create documents.make ("documents")
			create tests.make ("tests")
			create src.make ("src")

			-- Create the files
			create requirements.make ("requirements.pdf", "This is our SRS...")
			create design.make ("design.pdf", "This is our API design...")
			create testplan.make ("testplan.pdf", "This is our test plan...")
			create readme.make ("README.md", "This is our README...")

			-- Add files and folders to the right folders
			repo.add (documents)
			repo.add (tests)
			repo.add (src)
			repo.add (readme)
			documents.add (requirements)
			documents.add (design)
			tests.add (testplan)

			-- Compute and print the size of the repo
			io.put_integer (repo.size)
		end

end
