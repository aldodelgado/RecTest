class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :company
      t.string :job_title
      t.string :department
      t.string :country

      t.timestamps
    end
  end
end
