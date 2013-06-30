class Game < ActiveRecord::Base
  belongs_to :user
  # belongs_to :gametype
  attr_accessible :playat, :tottime, :type, :winner



#    @user=attributes[:user]
#    @type=[:gametype]
#  end

  def gamesetup
    sizing=10
    minearray=Array.new(sizing)
    minearray.map!{Array.new(sizing,0)}
    minearray.each{|v| p v}
#    count=10
#    sizing=minearray.length
#    while count!=0 do
#      minearray[rand(10)][rand(10)]=1
#      count=count-1
#    end
  end

  def printgrid
    bomber=Marshal.load( Marshal.dump(self) )
#    if bombed==1
#      bomber.each{|v| p v}
#    else
#      bomber.each do |g|
#        g.map! do |f|
#          if f==1
#            0
#          else
#            0
#          end
#        end
#      end
      p bomber.each{|v| p v}
#    end
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


end
