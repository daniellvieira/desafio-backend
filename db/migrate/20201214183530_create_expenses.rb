class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :parlamentarian, null: false, foreign_key: true
      t.date :date_issue
      t.string :provider
      t.decimal :value, precision: 10, scale: 2
      t.text :url_document
      t.string :id_document

      t.timestamps
    end
  end
end
