class ProcedureMembership < ApplicationRecord
  belongs_to :procedure, required: true
  belongs_to :membership_plan, required: true
end
