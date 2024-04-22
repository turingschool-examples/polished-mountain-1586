class CreateExperimentScientists < ActiveRecord::Migration[7.1]
  def change
    create_table :experiment_scientists do |t|
      t.references :experiment, null: false, foreign_key: true
      t.references :scientist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
