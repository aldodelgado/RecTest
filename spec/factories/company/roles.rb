FactoryBot.define do
  factory :company_role, class: 'Company::Role' do
    company   { create(:company) }
    name      { Faker::Construction.role }
  end
end
