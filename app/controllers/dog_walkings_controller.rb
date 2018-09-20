class DogWalkingsController < ApplicationController
  before_action :set_dog_walking, only: [:show, :start_walk, :finish_walk]
  has_scope :only_next, type: :boolean

  # GET /dog_walkings
  def index
    @dog_walkings = paginate apply_scopes(DogWalking).all.decorate, per_page: 5

    #paginate json: @dog_walkings, per_page: 2
    #paginate
  end

  # GET /dog_walkings/1
  def show
    @dog_walking
  end

  # POST /dog_walkings
  def create
    @dog_walking = DogWalking.new(dog_walking_params)

    if @dog_walking.save
      @dog_walking = @dog_walking.decorate
      render :show, status: :created, location: @dog_walking
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  # POST /start_walk/1
  def start_walk
    if @dog_walking.start_walk
      head :ok
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  # POST /finish_walk/1
  def finish_walk
    if @dog_walking.finish_walk
      head :ok
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  private
    def set_dog_walking
      @dog_walking = DogWalking.find(params[:id]).decorate
    end

    def dog_walking_params
      params.permit(:duration, :scheduled_to, :lat, :lng, :pet_ids => [])
    end
end
