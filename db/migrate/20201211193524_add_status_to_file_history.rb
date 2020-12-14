class AddStatusToFileHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :file_histories, :status, :integer, default: 0
  end
end
