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

FactoryBot.define do
  factory :user do
    company     { create(:company) }
    job_title   { Faker::Job.title }
    department  { Faker::Commerce.department}
    country     { Faker::Address.country }
  end
end
