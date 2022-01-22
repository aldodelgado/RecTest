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

class UserCompanyRole < ApplicationRecord

  belongs_to :user
  belongs_to :company_role

end
