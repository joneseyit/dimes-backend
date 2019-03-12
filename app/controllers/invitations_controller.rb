class InvitationsController < ApplicationController
    def index
        @invitations = Invitation.all
        render json: @invitations
    end

    def create
        @invitation = Invitation.new(invitation_params)
        if @invitation.save
            render json: @invitation, status: :created
        else
            render json: { error: "Invitation could not be sent." }, status: :not_acceptable
        end
    end

    private

    def invitation_params
        params.permit(:user_id, :invited_id, :game_id, :responded)
    end
end
