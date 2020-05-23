require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
# name: doc.css('h1.profile-name')
# location: doc.css('h2.profile-location')
    array = []
    doc.css('div.roster-cards-container').each do |roster|
      roster.css('.student-card a').each do |card|
      #binding.pry
      profile = card.attribute('href').value
      name = card.css('h4.student-name').text
      location = card.css('p.student-location').text

      array << {:name => name, :profile_url => profile, :location => location}
      end

    end
    array

  end

  def self.scrape_profile_page(profile_url)
    student = {}
    doc = Nokogiri::HTML(open(profile_url))
    description_links = doc.css('div.social-icon-container a').map {|link| link.attr('href')} #<- Description

    student[:linkedin] = description_links.find {|link| link.include?('linkedin')} if description_links.find {|link| link.include?('linkedin')}
    student[:twitter] = description_links.find {|link| link.include?('twitter')} if description_links.find {|link| link.include?('twitter')}
    student[:github] = description_links.find {|link| link.include?('github')} if description_links.find {|link| link.include?('github')}
    student[:blog] = description_links.find {|link| !link.include?('github') && !link.include?('twitter') && !link.include?('linkedin')} if description_links.find {|link| !link.include?('github') && !link.include?('twitter') && !link.include?('linkedin')}

    student[:bio] = doc.css('.description-holder p').text
    student[:profile_quote] = doc.css('.profile-quote').text

    student
    #binding.pry

  end

end
