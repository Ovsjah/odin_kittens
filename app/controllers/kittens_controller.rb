class KittensController < ApplicationController
  before_action :get_kitten_columns, except: :destroy
  before_action :get_kitten, only: %i[show edit update]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to root_path, flash: { success: "kitten #{@kitten.name} was added" }
    else
      flash.now[:danger] = "Sorry, something went wrong."
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to root_path, flash: { success: "Kitten #{@kitten.name} has been successfully updated!" }
    else
      render :edit
    end
  end

  def destroy
    @kitten = Kitten.destroy(params[:id]) if Kitten.exists?(params[:id])
    redirect_to root_path, flash: { success: "Kitten #{@kitten&.name} has successfully been deleted." }
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

    def get_kitten
      @kitten = Kitten.find(params[:id])
    end

    def get_kitten_columns
      @kitten_columns = Kitten.columns.map { |c| c.name if c.type == :string }.compact
    end
end
