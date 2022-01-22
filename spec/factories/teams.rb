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

FactoryBot.define do
  factory :team do
    company { create(:company) }
    name    { Faker::Team.name }
  end
end
