# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_teams_on_team_id  (team_id)
#  index_user_teams_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe User::Team, type: :model do

  it 'belongs_to user' do
    user = User::Team.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'belongs_to company_role' do
    team = User::Team.reflect_on_association(:team)
    expect(team.macro).to eq(:belongs_to)
  end

end
