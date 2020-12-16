class AddTotalToParlamentarians < ActiveRecord::Migration[6.0]
  def change
    add_column :parlamentarians, :total, :decimal, precision: 10, scale: 2
  end
end
