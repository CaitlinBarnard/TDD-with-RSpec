# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

# rspec spec.rb

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
    def full_name
        if @middle_name.nil?
            @first_name + " " + @last_name
        else
            @first_name + " " + @middle_name + " " + @last_name
        end
    end
    
    def full_name_with_middle_initial
        @first_name + " " + @middle_name[0] + " " + @last_name
    end
    
    def initials
        if @middle_name.nil?
            @first_name[0] + @last_name[0]
        else
            @first_name[0] + @middle_name[0] + @last_name[0]
        end
    end
end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
        person = Person.new(first_name: "Steven",middle_name: "Grant", last_name: "Rogers")
        expect(person.full_name).to eq("Steven Grant Rogers")
    end
    it "does not add extra spaces if middle name is missing" do
        person = Person.new(first_name: "Bucky", last_name: "Barnes")
        expect(person.full_name).to eq("Bucky Barnes")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "concatenates the full name whilst changing the middle name to only the initial" do
        person = Person.new(first_name: "Clinton", middle_name: "Francis", last_name: "Barton")
        expect(person.full_name_with_middle_initial).to eq("Clinton F Barton")
    end
  end


  describe "#initials" do
    it "changes first, middle and last names into initials" do
        person = Person.new(first_name: "Tony", middle_name: "Edward", last_name: "Stark")
        expect(person.initials).to eq("TES")
    end
      
    it "changes first and last names into initials when middle name is nil" do
      person = Person.new(first_name: "Natasha", last_name: "Romanov")
      expect(person.initials).to eq("NR")
    end
  end
end