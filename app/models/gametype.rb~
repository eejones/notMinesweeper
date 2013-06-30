class Gametype < ActiveRecord::Base
  has_many :games
  has many :users, through :games

  attr_accessor :type, :title

  validates :type, presence: true, uniqueness: true
  validates :title. presence: true. uniqueness: true

  def initialize(user,type)
    @user = attributes[:user]
    @type = attributes[:type]
    @game.New
    if @type=1 
      Minesweeper.new(@user)
    end
  end
end

class Minesweeper < Game
  def initialize
    @game.new
    minearray=Array.new(10)
    minearray.map!{Array.new(sizing,0)}
    minearray
    bombing(10)
  end

  def bombing(bombs)
    bombarray=self.dup
    count=bombs.to_i
    sizing=bombarray.length
    while count!=0 do
      bombarray[rand(sizing)][rand(sizing)]=1
      count=count-1
    end
  end

  def guess(x,y)
    guess=self[x][y]
    bombarray=self.to_ary
    bombed=0
    if guess==1
      puts "That is a bomb"
      bombed=1
    else
      puts "You are safe"
      numcount=0
      for v in (-1..1)
        for h in (-1..1)
          numcount = numcount + bombarray[x+v][y+h]
        end
      end
      self[x][y]=numcount
      puts "These are the bombs around you:"
      p numcount
    end
    print "Grid:"
    bombarray.printgrid(guess,bombed)
  end

  def printgrid(guess,bombed)
    bomber=Marshal.load( Marshal.dump(self) )
    if bombed==1
      bomber.each{|v| p v}
    else
      bomber.each do |g|
        g.map! do |f|
          if f==1
            0
          else
            0
          end
        end
      end
      p bomber.each{|v| p v}
    end
end

end
