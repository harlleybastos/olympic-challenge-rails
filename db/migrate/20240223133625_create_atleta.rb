class CreateAtleta < ActiveRecord::Migration[7.1]
  def change
    create_table :atleta do |t|
      t.string :nome

      t.timestamps
    end
  end
end
