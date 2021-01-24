class MembershipPlan < ApplicationRecord
  has_many :procedures, through: :procedure_memberships
  has_many :procedure_memberships, inverse_of: :membership_plan, dependent: :delete_all
  has_many :members
end
