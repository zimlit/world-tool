class CreateGalaxies < ActiveRecord::Migration[7.0]
  def change
    create_table :galaxies do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_reference :galaxies, :projects, index: true, foreign_key: true
  end
end
