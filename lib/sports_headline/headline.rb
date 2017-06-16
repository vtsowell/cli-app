class SportsHeadline::Headline

  attr_accessor :title, :author, :sport, :url

  @@all = []

  def self.new_from_index_page(h)
    #it should return instances of Headline
    self.new(
    h.css("div.media-body h3").text,
    h.css("div.media-body span.author").text,
    h.css("div.media-body span.sport").text,
    h.css("div.media-body h3")['href']
    )

  end

  def initialize(title=nil, author=nil, sport=nil, url=nil)
    @title = title
    @author = author
    @sport = sport
    @url = url
    @@all << self
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

end
