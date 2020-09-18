class Cult
    attr_reader :name, :location, :year, :slogan
    @@all = []
    def initialize (name, location, year, slogan)
        @name = name
        @location = location
        @year = year
        @slogan = slogan
        self.class.all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower, date)
        BloodOath.new(follower, self, date)
    end

    def cult_members
        BloodOath.all.select {|o| o.cult == self}
    end

    def cult_population
        self.cult_members.length
    end

    def self.find_by_name(name)
        self.all.find {|o| o.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|o| o.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select {|o| o.year == year}
    end

    def ages
        cult_members.map {|o| o.follower.age.to_f}
    end

    def average_age
        ages.sum / self.cult_population
    end

    def my_followers_mottos
        cult_members.map {|o| o.follower.life_motto}.each {|i| puts i}
    end

    def self.least_popular
        lowest = self.all.min_by {|o| o.cult_population}.cult_population
        self.all.select {|o| o.cult_population == lowest}
    end

    def self.most_common_location
        arr = self.all.map {|o| o.location}
        arr.max_by {|o| arr.count(o)}
    end
end