class DogWalkingDecorator < ApplicationDecorator
  delegate_all

  def final_duration
    if object.ended_at.nil? || object.started_at.nil?
      return '-'
    end
    ((object.ended_at - object.started_at) / 60).to_i
  end

end
