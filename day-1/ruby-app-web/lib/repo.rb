require 'pg'
require 'sequel'

class Repo
  def initialize
    @db = Sequel.connect('postgres://postgres@localhost:5432/decouverte')
    runSchema(@db)
    @contacts = @db[:contacts]
  end

  def add(contact)
    @contacts.insert(nom: contact)
  end

  def all
    @contacts.all
  end

  def runSchema(db)
    db.create_table :contacts do
      primary_key :id
      String :nom
    end unless(db[:contacts])
  end
end
