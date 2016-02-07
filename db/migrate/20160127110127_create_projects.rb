class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :rank
      t.string :name
      t.boolean :has_subsection
      t.timestamps null: false
    end
  end
end
