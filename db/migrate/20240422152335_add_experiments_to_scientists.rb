class AddExperimentsToScientists < ActiveRecord::Migration[7.1]
  def change
    add_reference :scientists, :experiment, foreign_key: true
  end
end
