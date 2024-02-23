class CreateCompeticaos < ActiveRecord::Migration[7.1]
  def change
    create_table :competicaos do |t|
      t.string :nome
      t.boolean :finalizada

      t.timestamps
    end
  end
end
