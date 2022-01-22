# == Schema Information
#
# Table name: company_roles
#
#  id         :integer          not null, primary key
#  company_id :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_company_roles_on_company_id  (company_id)
#

require 'rails_helper'

RSpec.describe Company::Role, type: :model do

  it 'belongs_to company' do
    company = Company::Role.reflect_on_association(:company)
    expect(company.macro).to eq(:belongs_to)
  end

end
