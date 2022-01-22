class CreateUserTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_teams do |t|
      t.belongs_to :user
      t.belongs_to :team

      t.timestamps
    end
  end
end
