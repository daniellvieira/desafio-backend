class AddMessageToFileHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :file_histories, :message, :string
  end
end
