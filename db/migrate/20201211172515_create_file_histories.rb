class CreateFileHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :file_histories do |t|
      t.string :description

      t.timestamps
    end
  end
end
