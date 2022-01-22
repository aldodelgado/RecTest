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

require 'rails_helper'

RSpec.describe User, type: :model do

  subject { FactoryBot.create(:user) }

  it { is_expected.to be_valid }

  it 'belongs_to company' do
    company = User.reflect_on_association(:company)
    expect(company.macro).to eq(:belongs_to)
  end

  it 'has_many user_teams' do
    user_teams = User.reflect_on_association(:user_teams)
    expect(user_teams.macro).to eq(:has_many)
  end

  it 'has_many teams' do
    teams = User.reflect_on_association(:teams)
    expect(teams.macro).to eq(:has_many)
  end

  describe 'after_create' do
    before { @user = FactoryBot.build(:user) }
    it 'run the create_company_role callback' do
      expect(@user).to receive(:create_company_role)
      @user.run_callbacks(:create)
    end
  end

end
