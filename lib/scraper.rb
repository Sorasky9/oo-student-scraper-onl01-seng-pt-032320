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
    doc = Nokogiri::HTML(open(profile_url))
    array = []
    binding.pry
    doc.css('div.details-container').each do |detail|
      detail.css('div.description-holder').each do |bio|




      end
    end
  end

end
