# == Schema Information
#
# Table name: user_company_roles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_company_roles_on_company_id  (company_id)
#  index_user_company_roles_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe UserCompanyRole, type: :model do

  it 'belongs_to user' do
    user = UserCompanyRole.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'belongs_to company_role' do
    company = UserCompanyRole.reflect_on_association(:company_role)
    expect(company.macro).to eq(:belongs_to)
  end

end
