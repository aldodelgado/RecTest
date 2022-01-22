FactoryBot.define do
  factory :user_team, class: 'User::Team' do
    user    { create(:user) }
    team    { create(:team) }
  end
end
