require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {{
    name: "sutekki",
    email: "info@example.com",
    password: "foobar78"
  }}

  let(:invalid_attributes) {{
    name: "sutekki",
    email: "info@example.com",
    password: ""
  }}

  let(:valid_session) { {} }

  describe "GET #show" do
    let(:user) { create(:user) }

    it "assigns the requested user as @user" do
      get :show, {:id => user.id}
      expect(assigns(:user)).to eq(user)
    end

    it "renders the index template" do
      get :show, {:id => user.id}
      expect(subject).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the index template" do
      get :new
      expect(subject).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      subject { post :create, {:user => valid_attributes}, valid_session }

      it "creates a new User" do
        expect { subject }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        expect(subject).to redirect_to(User.last)
      end

      it "loged in after create" do
        post :create, {:user => valid_attributes}, valid_session
        expect(session[:user_id]).not_to be_nil
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end
end
