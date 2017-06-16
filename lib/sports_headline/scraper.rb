class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.sportingnews.com/"))
  end

  def scrape_headline_index
    self.get_page.css("div.latest-news-module module li")
  end

  def make_headlines
    scrape_headline_index.each do |h|
      SportsHeadline::Headline.new_from_index_page(r)
    end
  end
end
