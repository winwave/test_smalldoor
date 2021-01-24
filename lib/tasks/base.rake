task add_procedure_to_membership: :environment do
  puts "add procedure_id #{ENV['procedure_id']} to membership_id #{ENV['membership_id']}"
  procedure_membership = ProcedureMembership.where(
      membership_plan_id: ENV['membership_id'],
      procedure_id: ENV['procedure_id']
  ).first_or_initialize
  procedure_membership.times = ENV['n']
  procedure_membership.save!
  puts "procedure_id #{procedure_membership.procedure_id} was added successfully #{procedure_membership.times} times to membership_id #{procedure_membership.membership_plan_id} in table ProcedureMembership"
end

task calculate_invoice: :environment do

  puts "calculate invoice for member_id #{ENV['member_id']} with the procedure_ids #{ENV['procedure_ids']}"
  member = Member.find(ENV['member_id'])
  eval(ENV['procedure_ids']).each do |procedure_id|
    member.member_activities.create!(procedure_id: procedure_id)
  end

  price = member.calculate_invoice

  puts "the price is #{price}"
end
