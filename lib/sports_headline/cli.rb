#our CLI controller

class SportsHeadline::CLI

  def call #this is the method that calls upon others and is invoked when the gem is run
    SportsHeadline::Scraper.new.make_headlines
    puts "Today's sports headlines:"
    list_headlines
    menu
    goodbye
  end

  def list_headlines
    #this is the method that scrapes ESPN and lists out the headlines of today's sports headlines
    puts "1. #{headline.title} "

    @headlines = SportsHeadline::Headline.today
  end

  def menu
    #this is the method that takes a date from user input and returns the link from the selected headline
    puts "Enter which headline you would like more to read more about, type list to relist today's headlines, or type exit"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        #print out small description and a link
        puts "headline 1: link"
      when "2"
        #...
      when "list"
        list_headlines
      else
        "Unsure what you were going for, type list or exit"
      end
    end
  end

  def goodbye
    puts "Come back tomorrow to check out the newest news in sports!"
  end
end
