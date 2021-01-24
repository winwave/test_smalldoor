class Member < ApplicationRecord
  has_one :membership_plan
  has_many :member_activities, inverse_of: :member, dependent: :delete_all
  has_many :procedures, through: :member_activities

  ##########################################################################
  # METHODS
  ##########################################################################

  def calculate_invoice
    price = 0
    list_procedure_used = self.member_activities
                              .group(:procedure_id).count
    list_procedure_used.each do |procedure_id, count|
      procedure_used_id = procedure_id
      # number of times the member underwent the procedure
      times = count
      procedure_membership = ProcedureMembership.where(procedure: procedure_used_id)
                                 .where(membership_plan: self.membership_plans_id)
      if procedure_membership.present?
        # number of times that the procedure included in membership plan
        times_offer = procedure_membership.pluck(:times)[0]

        # number of times that the member has to pay for the procedure
        times = [0, times - times_offer].max
      end

      price += times * Procedure.find(procedure_used_id).price
    end

    price
  end
end
