require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



def create_n_followers(n)
  names = ["Bill",
  "Ted",
  "Joe",
  "Bob"]
  n.times {
    follower = Follower.new(names[rand(4)], (rand(10) + 20), names[rand(4)])
    (rand(10) + 1).times {follower.join_cult(Cult.all[rand(3)], "Today")}
  }
end


# will = Follower.new('Will', 29, 'Eat Beans!')
tom = Follower.new('Tom', 27, 'Oops')

scientology = Cult.new('Scientology', 'Clearwater', 1965, 'Hail Xenu')
manson = Cult.new('The Manson Family', 'Los Angeles', 1965, 'Helter Skelter')
heavens_gate = Cult.new("Heaven's Gate", 'Los Angeles', 1982, 'Save Yourselves')

tom.join_cult(scientology, 'Today')

create_n_followers(20)

# will.join_cult(scientology, 'Today')
# will.join_cult(manson, "Tomorrow")
# will.join_cult(heavens_gate, 'Today')
# tom.join_cult(scientology, 'Today')
# tom.join_cult(manson, 'Yesterday')
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits