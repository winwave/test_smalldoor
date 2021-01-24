class Procedure < ApplicationRecord
  has_many :membership_plans, through: :procedure_memberships
  has_many :members, through: :member_activities
  has_many :member_activities, inverse_of: :procedure, dependent: :delete_all
  has_many :procedure_membershipssssses, inverse_of: :procedure, dependent: :delete_all
end