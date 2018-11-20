class Vampire

  @@coven = []

  def self.coven
    return @@coven
  end

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def name
    return @name
  end

  def age
    return @age
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
  end

  def drink_blood
    @drank_blood_today = true
  end

  def drank_blood_today
    return @drank_blood_today
  end

  def in_coffin
    return @in_coffin
  end

  def self.sunrise
    @@coven.reverse.each do |vampire|
      if vampire.in_coffin && vampire.drank_blood_today == false
        @@coven.delete(vampire)
      end
    end
  end

  def self.sunset
    @drank_blood_today = false
    @in_coffin = false
  end

  def go_home
    @in_coffin = true
  end

end

marina = Vampire.create("M", 3800)
vic = Vampire.create("V", 4200)
gab= Vampire.create("G", 85957598)
puts Vampire.coven
puts "________"
puts Vampire.sunset
marina.drink_blood
marina.go_home
puts "---- vampires at sunset:"
puts Vampire.sunrise
puts "---- vampires at sunrise:"
puts Vampire.coven
