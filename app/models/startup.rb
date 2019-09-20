class Startup
  attr_accessor :name
  attr_reader :founder, :domain
  @@startups = []
  @@domains = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@domains.push(domain)
    @@startups.push(self)
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
    return self
  end

  def self.all
    @@startups
  end

  def self.find_by_founder(founder)
    @@startups.find{|startup| startup.founder == founder}
  end
  
  def self.domains
    @@domains
  end

  def sign_contract(vc, investment_type, amount_invested)
    new_funding = FundingRound.new(self, vc, investment_type, amount_invested.to_f)
    return new_funding
  end

  def num_funding_rounds
    FundingRound.all.select{|fr| fr.startup == self}.length
  end

  def investors
    all_frs = FundingRound.all.select{|fr| fr.startup == self}
    all_vcs = all_frs.map!{|fr| fr.vc}.uniq!
    return all_vcs
  end

  def big_investors
    self.investors.select{|investor| investor.total_worth >= 1000000000}
  end 

end
