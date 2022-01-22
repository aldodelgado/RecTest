# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  company_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teams_on_company_id  (company_id)
#

class Team < ApplicationRecord

  validates :name, presence: true

  belongs_to :company
  has_many :user_teams, class_name: 'User::Team'
  has_many :users, through: :user_teams

  after_create :create_company_role

  def create_company_role
    company.roles.find_or_create_by(name: name)
  end

end
