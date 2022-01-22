class CreateUserCompanyRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_company_roles do |t|
      t.belongs_to :user
      t.belongs_to :company

      t.timestamps
    end
  end
end
