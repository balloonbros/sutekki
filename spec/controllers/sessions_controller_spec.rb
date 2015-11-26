require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let(:valid_attributes) {{
    email: "info@example.com",
    password: "foobar78"
  }}

  let(:invalid_attributes) {{
    email: "",
    password: ""
  }}

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #new" do
    it "sends invalid password" do
      post :create, session: invalid_attributes
      expect(flash[:session]).to be_present
    end
  end
end
