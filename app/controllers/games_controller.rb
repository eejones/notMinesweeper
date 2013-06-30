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

end
