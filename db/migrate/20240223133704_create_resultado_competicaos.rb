class CreateResultadoCompeticaos < ActiveRecord::Migration[7.1]
  def change
    create_table :resultado_competicaos do |t|
      t.references :atleta, null: false, foreign_key: true
      t.references :competicao, null: false, foreign_key: true
      t.references :resultado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
