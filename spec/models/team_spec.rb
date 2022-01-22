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

require 'rails_helper'

RSpec.describe Team, type: :model do

  subject { FactoryBot.create(:team) }

  it { is_expected.to be_valid }

  it 'belongs_to company' do
    company = Team.reflect_on_association(:company)
    expect(company.macro).to eq(:belongs_to)
  end

  it 'has_many user_teams' do
    user_teams = Team.reflect_on_association(:user_teams)
    expect(user_teams.macro).to eq(:has_many)
  end

  it 'has_many users' do
    users = Team.reflect_on_association(:users)
    expect(users.macro).to eq(:has_many)
  end

  describe 'after_create' do
    before { @team = FactoryBot.build(:team) }
    it 'run the create_company_role callback' do
      expect(@team).to receive(:create_company_role)
      @team.run_callbacks(:create)
    end
  end

end
