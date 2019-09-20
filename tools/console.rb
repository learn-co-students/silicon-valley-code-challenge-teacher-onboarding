require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
flatiron_school = Startup.new('Flatiron School', 'Avi Flombaum', 'EdTech')
lame_school = Startup.new('BlahBlah School', 'IDK', 'EdTech')

bill_gates = VentureCapitalist.new('Bill Gates', 2000000000)
mark_cuban = VentureCapitalist.new('Mark Cuban', 1000000000)
matt_campbell = VentureCapitalist.new('Matthew Campbell', 200000)

fs_round_1 = FundingRound.new(flatiron_school, matt_campbell, 'roundA', 100000)
fs_round_2 = FundingRound.new(flatiron_school, mark_cuban, 'roundB', 1000000)
fs_round_3 = FundingRound.new(flatiron_school, bill_gates, 'roundC', 2000000)

ls_round_1 = FundingRound.new(lame_school, bill_gates, 'roundA', 1000900)

flatiron_school.sign_contract(matt_campbell, 'roundA', 100000)
flatiron_school.sign_contract(matt_campbell, 'roundB', 200000)
flatiron_school.sign_contract(bill_gates, 'roundZ', 10000000)

flatiron_school.investors

matt_campbell.offer_contract(flatiron_school, 'roundD', 100000)
mark_cuban.offer_contract(flatiron_school, 'roundY', 1000000)

mark_cuban.funding_rounds
binding.pry
0 #leave this here to ensure binding.pry isn't the last line