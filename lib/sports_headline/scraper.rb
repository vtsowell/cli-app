class Scraper

  def get_headline
    h = Nokogiri::HTML(open("http://www.sportingnews.com/"))
    #binding.pry
  end

  def scrape_headline_index
    self.get_headline.css(".feed").css(".latest-news-module").css(".media-list").css(".media")

  end

  def make_headlines
    self.scrape_headline_index.each do |h|
      if h.children[1]["class"] != "ad-unit-module ad-right injected-ad"
        SportsHeadline::Headline.new_from_index_page(h)
      end
    end
  end
end
