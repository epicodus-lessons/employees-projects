class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:project_id, :integer)

      t.timestamps()
    end
  end
end
