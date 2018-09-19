class DogWalkingsController < ApplicationController
  before_action :set_dog_walking, only: [:show, :start_walk, :finish_walk]

  # GET /dog_walkings
  def index
    @dog_walkings = DogWalking.all
  end

  # GET /dog_walkings/1
  def show
  end

  # POST /dog_walkings
  def create
    @dog_walking = DogWalking.new(dog_walking_params)

    if @dog_walking.save
      render :show, status: :created, location: @dog_walking
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  # POST /start_walk/1
  def start_walk
    if @dog_walking.start_walk
      render :show, status: :ok, location: @dog_walking
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  # POST /finish_walk/1
  def finish_walk
    if @dog_walking.finish_walk
      render :show, status: :ok, location: @dog_walking
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  private
    def set_dog_walking
      @dog_walking = DogWalking.find(params[:id])
    end

    def dog_walking_params
      params.permit(:duration, :scheduled_to, :lat, :lng, :pet_ids => [])
    end
end
