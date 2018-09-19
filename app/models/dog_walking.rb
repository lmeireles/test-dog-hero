class DogWalking < ApplicationRecord
  before_create :set_price

  has_and_belongs_to_many :pets

  enum status: [:scheduled, :ongoing, :finished]
  attr_accessor :validate_start_walk, :validate_finish_walk

  validates :duration, :lat, :lng, :scheduled_to, :pets, presence: true
  validates :duration, inclusion: {in: [30, 60]}

  def start_walk
    if self.scheduled?
      self.started_at = DateTime.now
      self.ongoing!
      self.save
    end
  end

  def finish_walk
    if self.ongoing?
      self.ended_at = DateTime.now
      self.finished!
      self.save
    end
  end

  private

  def set_price
    case duration
    when 30
      self.price = 25
      if pets.length > 1
        self.price += (pets.length - 1) * 15
      end

    when 60
      self.price = 35
      if pets.length > 2
        self.price += (pets.length - 2) * 20
      end
    else
      raise
    end
  end
end
