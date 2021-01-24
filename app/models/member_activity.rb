class MemberActivity < ApplicationRecord
  belongs_to :member, required: true
  belongs_to :procedure, required: true
end
