require 'rails_helper'

RSpec.describe ReactionsController, type: :controller do

  let(:valid_attributes) do
    {
      idea_id: "1",
      action: ":MyAction:"
    }
  end

  let(:invalid_attributes) do
    {
      idea_id: "",
      action: ""
    }
  end


  before do
    log_in create(:user)
  end

  describe "POST #create" do
    it "returns http created" do
      post :create, reaction: valid_attributes
      expect(response).to have_http_status(:created)
    end

    it "returns http unprocessable_entity" do
      post :create, reaction: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let(:reaction) { create(:reaction) }
    it "returns no_content" do
      delete :destroy, id: reaction.id
      expect(response).to have_http_status(:no_content)
    end
  end

end
