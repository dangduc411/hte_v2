class Admin::GamesController < Admin::BaseController
  before_filter :require_login
  before_action :set_admin_game, only: [:show, :edit, :update, :destroy]

  # GET /admin/games
  # GET /admin/games.json
  def index
    @admin_games = Game.all
  end

  # GET /admin/games/1
  # GET /admin/games/1.json
  def show
  end

  # GET /admin/games/new
  def new
    @admin_game = Game.new
  end

  # GET /admin/games/1/edit
  def edit
  end

  # POST /admin/games
  # POST /admin/games.json
  def create
    @admin_game = Game.new(game_params)

    respond_to do |format|
      if @admin_game.save
        format.html { redirect_to admin_games_url, success: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @admin_game }
      else
        format.html { render :new }
        format.json { render json: @admin_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/games/1
  # PATCH/PUT /admin/games/1.json
  def update
    respond_to do |format|
      if @admin_game.update(game_params)
        format.html { redirect_to admin_games_url, success: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_game }
      else
        format.html { render :edit }
        format.json { render json: @admin_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/games/1
  # DELETE /admin/games/1.json
  def destroy
    @admin_game.destroy
    respond_to do |format|
      format.html { redirect_to admin_games_url, success: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_game
      @admin_game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :psn_link, :poster, :remote_poster_url, :remove_poster, :disc)
    end
end
