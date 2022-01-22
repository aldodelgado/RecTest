# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord

  validates :domain, presence: true

  has_many :users
  has_many :teams
  has_many :roles

  def sync_users_job_titles_to_roles
    users.each do |user|
      roles.find_or_create_by(name: user.job_title)
    end
  end

  def sync_team_name_to_roles
    teams.each do |team|
      roles.find_or_create_by(name: team.name)
    end
  end

end
