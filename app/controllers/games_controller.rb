class GamesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @game }
    end
  end

  def new
    @game = Game.new
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @game }
    end
  end

  def create
    @user = current_user
    @game = Game.new(params[:game])
    respond_to do |format|
      if @game.save
        flash[:success] = "Let's Play!"
        format.html { redirect_to user_game_path(@current_user,@game), notice: 'Your game will begin now.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def setup
    sizing=10
    minearray=Array.new(sizing)
    minearray.map!{Array.new(sizing,0)}
    minearray
    count=10
    sizing=minearray.length
    while count!=0 do
      minearray[rand(10)][rand(10)]=1
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
