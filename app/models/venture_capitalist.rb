class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth
  @@venture_capitalists = []
  
  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@venture_capitalists << self
  end

  def self.all
    @@venture_capitalists
  end

  def self.tres_commas_club
    tres = @@venture_capitalists.select{|vc| vc.total_worth >= 1000000000}
    tres_values = tres.map{|vc| vc.total_worth }
    return tres_values.reduce(:+)
  end

  def offer_contract(startup, investment_type, amount)
    offer = FundingRound.new(startup, self, investment_type, amount.to_f)
    return offer
  end

  def funding_rounds
    FundingRound.all.select{|fr| fr.vc == self}
  end

  def portfolio
    companies = self.funding_rounds.map{|fr| fr.startup}.uniq
    return companies
  end

  def biggest_investment
    self.funding_rounds.max{|a,b| a.investment <=> b.investment}
  end

  def invested(domain)
    total_invested_in_domain = self.funding_rounds.select{|fr| fr.startup.domain == domain}
    total_invested_in_domain.map!{|fr| fr.investment}
    answer = total_invested_in_domain.reduce(:+)
    return answer ? answer : 0
  end

end
