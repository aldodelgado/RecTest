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

class Company::Role < ApplicationRecord

  belongs_to :company

end
