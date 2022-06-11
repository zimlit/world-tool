class AddProjectIdToGalaxies < ActiveRecord::Migration[7.0]
  def change
    remove_column :galaxies, :projects_id, :bigint
    add_column :galaxies, :project_id, :integer
  end
end
