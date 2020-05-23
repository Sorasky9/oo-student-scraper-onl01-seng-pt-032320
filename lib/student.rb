class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
    #binding.pry
  end

  def self.create_from_collection(students_array)
    #<-students_array is a list of hashes
    students_array.each do |key| #<- key brings only the name and location of the hash
      Student.new(key) #<- Student class instantiate specifically of the name inside hash called key from the iteration above.
  #binding.pry
  end
  end

  def add_student_attributes(attributes_hash)
    #<- attributes_hash has a collection of hashes from the Scraper.scrape_profile_page
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    #^ We take the attributes_hash argument and iterate both the keys and value and say "Student (self), send the following:
    # types of data (key) and specific types of data associated witht the type of data (value)
    # and "

    binding.pry


  end

  def self.all

  end
end
