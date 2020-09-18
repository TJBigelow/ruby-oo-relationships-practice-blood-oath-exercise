class BloodOath
    attr_reader :follower, :cult, :date
    @@all = []
    def initialize(follower, cult, date)
        @follower = follower
        @cult = cult
        @date = date
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.first_oath
        BloodOath.all[0]
    end
end