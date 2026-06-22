require 'sequel'

DB = Sequel.connect('sqlite://todos.db')

DB.create_table? :todos do
  primary_key :id
  String :title
  TrueClass :completed, default: false
end