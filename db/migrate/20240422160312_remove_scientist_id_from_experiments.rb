class RemoveScientistIdFromExperiments < ActiveRecord::Migration[7.1]
  def change
    remove_column :experiments, :scientist_id, :bigint
  end
end
