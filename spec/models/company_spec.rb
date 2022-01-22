# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Company, type: :model do

  subject { FactoryBot.create(:company) }

  it { is_expected.to be_valid }

  it 'has_many users' do
    users = Company.reflect_on_association(:users)
    expect(users.macro).to eq(:has_many)
  end

  it 'has_many teams' do
    teams = Company.reflect_on_association(:teams)
    expect(teams.macro).to eq(:has_many)
  end

  it 'has_many roles' do
    roles = Company.reflect_on_association(:roles)
    expect(roles.macro).to eq(:has_many)
  end

  describe '.sync_users_job_titles_to_roles' do
    it 'has users without company roles' do
      3.times { FactoryBot.create(:user, company: subject) }
      subject.roles.delete_all
      expect(subject.roles).to be_empty
    end

    it 'has users with company roles' do
      3.times { FactoryBot.create(:user, company: subject) }
      expect(subject.roles).not_to be_empty
    end
  end

  describe '.sync_team_name_to_roles' do
    it 'has teams without company roles' do
      3.times { FactoryBot.create(:team, company: subject) }
      subject.roles.delete_all
      expect(subject.roles).to be_empty
    end

    it 'has teams with company roles' do
      3.times { FactoryBot.create(:team, company: subject) }
      expect(subject.roles).not_to be_empty
    end
  end

end
