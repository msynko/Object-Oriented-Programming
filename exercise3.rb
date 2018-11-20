class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_strength = 3
  @@default_speed = 1


  def initialize( zombie_speed, zombie_strength)
    @zombie_speed = zombie_speed
    @zombie_strength = zombie_strength

    if @zombie_speed > @@max_speed
      @zombie_speed = @@default_speed
    end
    if @zombie_strength > @@max_strength
      @zombie_strength = @@default_strength
    end
  end

def self.all
  return @@horde
end

def self.spawn
   new_zombie = rand(@@plague_level + 1)
   new_zombie.times do
     @@horde << Zombie.new(rand(@@max_speed + 1),rand(@@max_strength + 1))
  end
end

def self.new_day
  some_die_off
  spawn
  increase_plague_level
end

def self.some_die_off
  number = rand (11)
  number.times do
    @@horde.pop
  end
end

def self.increase_plague_level
  @@plague_level += rand(3)
end


def encounter
  if outeun_zombie?
    return "Escape unscathed"
  elsif survive_attack?
    new_zombie = Zombie.new(@zombie_speed, @zombie_strength)
    @@horde << new_zombie
    return "You are now a zombie."
 else
   return "You died."
 end
end

def outeun_zombie?
  my_speed = rand(@@max_speed +1)
  return my_speed > @zombie_speed
end

def survive_attack?
  my_strength = rand(@@max_strength +1)
  return my_strength > @zombie_strength
end



end

puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
