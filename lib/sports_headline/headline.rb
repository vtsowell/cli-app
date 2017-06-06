class SportsHeadline::Headline

  def self.today
    #i should return instances of Headline
    puts "1. headline 1"
    headline_1 = self.new
    headline_1.name = "Warrants signed for 3 Michigan State players"
    headline_1.author = "Dan Murphy"
    headline_1.sport = "Football"
  end
end
