class ReactionsController < ApplicationController
  before_action :logged_in_user
  before_action :set_reaction, only: [:destroy]

  def create
    @reaction = Reaction.new(reaction_params)
    @reaction.user_id = current_user.id

    if @reaction.save
      render json: @reaction, status: :created
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reaction.destroy
    head :no_content
  end

  private

  def reaction_params
    params.require(:reaction).permit(:idea_id, :action)
  end

  def set_reaction
    @reaction = Reaction.find(params[:id])
  end
end
