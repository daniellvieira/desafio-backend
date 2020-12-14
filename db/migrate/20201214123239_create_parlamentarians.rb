class CreateParlamentarians < ActiveRecord::Migration[6.0]
  def change
    create_table :parlamentarians do |t|
      t.string :name
      t.string :id_register
      t.string :num_portfolio
      t.string :num_legislature
      t.string :uf
      t.string :political_party
      t.string :cod_legislature

      t.timestamps
    end
  end
end
