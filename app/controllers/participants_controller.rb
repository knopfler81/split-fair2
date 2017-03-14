# class ParticipantsController < ApplicationController
#   def new
#     @participant = Participant.new(params_participant)
#   end

#   def create
#     @participant = Participant.new(params_participant)
#     @participant.save
#   end

#   private
#   def params_participant
#     params(:participant).require(:first_name, :salary, :event_id)
#   end
# end
