require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  let(:valid_attributes) {{
    title: "title",
    body: "body",
    published: true
  }}

  let(:invalid_attributes) {{
    title: "",
    body: "",
    published: true
  }}

  let(:idea_attributes) {{
    title: "title",
    body: "body",
    user_id: create(:user).id,
    published: true
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IdeasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before do
    log_in create(:user)
  end

  describe "GET #index" do
    it "assigns all ideas as @ideas" do
      idea = Idea.create! idea_attributes
      get :index, {}, valid_session
      expect(assigns(:ideas)).to eq([idea])
    end
  end

  describe "GET #show" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! idea_attributes
      get :show, {:id => idea.to_param}, valid_session
      expect(assigns(:idea)).to eq(idea)
    end
  end

  describe "GET #new" do
    it "assigns a new idea as @idea" do
      get :new, {}, valid_session
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe "GET #edit" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! idea_attributes
      get :edit, {:id => idea.to_param}, valid_session
      expect(assigns(:idea)).to eq(idea)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Idea" do
        expect {
          post :create, {:idea => valid_attributes}, valid_session
        }.to change(Idea, :count).by(1)
      end

      it "assigns a newly created idea as @idea" do
        post :create, {:idea => valid_attributes}, valid_session
        expect(assigns(:idea)).to be_a(Idea)
        expect(assigns(:idea)).to be_persisted
      end

      it "redirects to the created idea" do
        post :create, {:idea => valid_attributes}, valid_session
        expect(response).to redirect_to(Idea.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved idea as @idea" do
        post :create, {:idea => invalid_attributes}, valid_session
        expect(assigns(:idea)).to be_a_new(Idea)
      end

      it "re-renders the 'new' template" do
        post :create, {:idea => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{
        title: "update title",
        body: "update body",
      }}

      it "updates the requested idea" do
        idea = Idea.create! idea_attributes
        put :update, {:id => idea.to_param, :idea => new_attributes}, valid_session
        idea.reload
        expect(idea[:title]).to eq(new_attributes[:title])
        expect(idea[:body]).to eq(new_attributes[:body])
      end

      it "assigns the requested idea as @idea" do
        idea = Idea.create! idea_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}, valid_session
        expect(assigns(:idea)).to eq(idea)
      end

      it "redirects to the idea" do
        idea = Idea.create! idea_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}, valid_session
        expect(response).to redirect_to(idea)
      end
    end

    context "with invalid params" do
      it "assigns the idea as @idea" do
        idea = Idea.create! idea_attributes
        put :update, {:id => idea.to_param, :idea => invalid_attributes}, valid_session
        expect(assigns(:idea)).to eq(idea)
      end

      it "re-renders the 'edit' template" do
        idea = Idea.create! idea_attributes
        put :update, {:id => idea.to_param, :idea => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested idea" do
      idea = Idea.create! idea_attributes
      expect {
        delete :destroy, {:id => idea.to_param}, valid_session
      }.to change(Idea.published, :count).by(-1)
    end

    it "redirects to the ideas list" do
      idea = Idea.create! idea_attributes
      delete :destroy, {:id => idea.to_param}, valid_session
      expect(response).to redirect_to(ideas_url)
    end
  end

end
