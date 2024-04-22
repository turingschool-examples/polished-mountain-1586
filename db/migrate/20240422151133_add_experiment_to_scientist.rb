class AddExperimentToScientist < ActiveRecord::Migration[7.1]
  def change
    add_reference :scientists, :experiment, null: false, foreign_key: true
  end
end
