# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  company_id :integer
#  job_title  :string
#  department :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_company_id  (company_id)
#

class User < ApplicationRecord

  validates :job_title, presence: true

  belongs_to :company
  has_many :user_teams, class_name: 'User::Team'
  has_many :teams, through: :user_teams

  after_create :create_company_role

  def create_company_role
    company.roles.find_or_create_by(name: job_title)
  end

end
