class CreateResultados < ActiveRecord::Migration[7.1]
  def change
    create_table :resultados do |t|
      t.decimal :valor
      t.string :unidade

      t.timestamps
    end
  end
end
