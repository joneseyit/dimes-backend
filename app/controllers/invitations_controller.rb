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
            render json: { error: "They already have an invite to that game." }, status: :not_acceptable
        end
    end

    def update
        @invitation = Invitation.find(params[:id])
        @invitation.update_attributes(invitation_params)
        if @invitation.save
            render json: @invitation
        else
            render json: "Your response hasn't been saved."
        end
    end

    private

    def invitation_params
        params.permit(:user_id, :invited_id, :game_id, :responded)
    end
end
