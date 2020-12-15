class AddColumnsToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :num_sub_quota, :string
    add_column :expenses, :desc_sub_quota, :string
    add_column :expenses, :num_spec_sub_quota, :string
    add_column :expenses, :desc_spec_sub_quota, :string
    add_column :expenses, :cpf_cnpj, :string
    add_column :expenses, :num_document, :string
    add_column :expenses, :type_document, :string
    add_column :expenses, :value_document, :string
    add_column :expenses, :value_gloss, :string
    add_column :expenses, :month, :string
    add_column :expenses, :year, :string
    add_column :expenses, :num_portion, :string
    add_column :expenses, :passenger, :string
    add_column :expenses, :stretch, :string
    add_column :expenses, :num_lot, :string
    add_column :expenses, :num_reimbursement, :string
    add_column :expenses, :value_refund, :string
    add_column :expenses, :num_parlamentarian, :string
  end
end