class Scraper

  def get_page
    Nokogiri::HTML(open("http://www.sportingnews.com/"))
  end

  def scrape_headline_index
    self.get_page.css("div.latest-news-module module li")
  end

  def make_headlines
    scrape_headline_index.each do |h|
      headline = Headline.new
      headline.sport = h.css("div.media-body span.sport").text
      restaurant.author = h.css("div.media-body span.author").text
      restaurant.title = h.css("div.media-body h3").text
      restaurant.url = h.css("div.media-body h3")['href']
    end
  end
end
