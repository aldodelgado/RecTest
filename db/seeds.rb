company_1 = FactoryBot.create :company
company_2 = FactoryBot.create :company
company_3 = FactoryBot.create :company

7.times   { FactoryBot.create :user, company: company_1 }
3.times   { FactoryBot.create :user, company: company_2 }
9.times   { FactoryBot.create :user, company: company_3 }

3.times   { FactoryBot.create :team, company: company_1 }
3.times   { FactoryBot.create :team, company: company_2 }
3.times   { FactoryBot.create :team, company: company_3 }

Team.create([
  {
    name: 'Team One',
  },
  {
    name: 'Team Two',
  },
  {
    name: 'Team Three',
  }
])

User.all.each do |user|
  User::Team.create(user: user, team: Team.all.sample(1).first)
end
