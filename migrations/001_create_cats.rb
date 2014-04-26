Sequel.migration do
  up do
    create_table(:cats) do
      primary_key :id
      String :name, :null=>false
      String :color, :null=>false
      Integer :kittens, default: 0
    end
  end

  down do
    drop_table(:cats)
  end
end