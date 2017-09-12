class SportsHeadline::Headline

  attr_accessor :title, :author, :sport

  @@all = []

  def self.new_from_index_page(h)
    #it should return instances of Headline

    self.new(
      h.css(".media-heading").css("a").text,
      h.css(".author").text,
      h.css(".media-body").css(".sport").text
      )
  end

  def initialize(title=nil, author=nil, sport=nil)
    @title = title
    @author = author
    @sport = sport
    @@all << self
  end

  def self.all
    @@all
  end

  def self.sport
    @sport
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
