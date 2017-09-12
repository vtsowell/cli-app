#our CLI controller

class SportsHeadline::CLI

  def call #this is the method that calls upon others and is invoked when the gem is run
    Scraper.new.make_headlines
    puts "Today's sports headlines:"
    list_headlines
    menu
    goodbye
  end

  def list_headlines
    #this is the method that scrapes ESPN and lists out the headlines of today's sports headlines
    SportsHeadline::Headline.all.each.with_index do |headline, index|
      puts "#{index + 1}. #{headline.title} by #{headline.author} (#{headline.sport})"
    end
  end

  def menu
    #this is the method that takes a date from user input and returns the link from the selected headline
    puts "Enter a sport to see only that sport's headlines, type list to relist today's headlines, or type exit"
    input = nil
    input = gets.strip.downcase
    while input != "exit"
        if input == "nfl"
          puts SportsHeadline::Headline.sport



          #puts "headline 1: link"
        elsif input == "golf"
          #...
        elsif input == "list"
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
