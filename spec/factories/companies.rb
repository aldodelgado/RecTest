# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :company do
    domain { Faker::Internet.domain_word }
  end
end
