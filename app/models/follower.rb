class Follower
    attr_reader :name, :age, :life_motto
    @@all = []
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        self.class.all << self
    end

    def self.all
        @@all
    end

    def cults
        BloodOath.all.select {|o| o.follower == self}.map {|o| o.cult}
    end

    def join_cult(cult, date)
        BloodOath.new(self, cult, date)
    end

    def self.of_a_certain_age(age)
        self.all.select {|o| o.age == age}
    end

    def my_cults_slogans
        self.cults.map {|o| o.slogan}.each {|slogan| puts slogan}
    end

    def self.most_active
        self.all.max_by {|o| o.cults.length}
    end

    def self.top_ten
        i = 0
        list = self.all.sort_by {|o| o.cults.length}.reverse
        10.times do
            puts list[i].name
            puts list[i].cults.length
            i += 1
        end
    end
end