require 'rails_helper'

RSpec.describe LabelsController, type: :controller do

  let(:valid_attributes) {{
    title: "label",
    published: true
  }}

  let(:invalid_attributes) {{
    title: ""
  }}

  before do
    log_in create(:user)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LabelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all labels as @labels" do
      label = Label.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:labels)).to eq([label])
    end
  end

  describe "GET #show" do
    it "assigns the requested label as @label" do
      label = Label.create! valid_attributes
      get :show, {:id => label.to_param}, valid_session
      expect(assigns(:label)).to eq(label)
    end
  end

  describe "GET #new" do
    it "assigns a new label as @label" do
      get :new, {}, valid_session
      expect(assigns(:label)).to be_a_new(Label)
    end
  end

  describe "GET #edit" do
    it "assigns the requested label as @label" do
      label = Label.create! valid_attributes
      get :edit, {:id => label.to_param}, valid_session
      expect(assigns(:label)).to eq(label)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Label" do
        expect {
          post :create, {:label => valid_attributes}, valid_session
        }.to change(Label, :count).by(1)
      end

      it "assigns a newly created label as @label" do
        post :create, {:label => valid_attributes}, valid_session
        expect(assigns(:label)).to be_a(Label)
        expect(assigns(:label)).to be_persisted
      end

      it "redirects to the created label" do
        post :create, {:label => valid_attributes}, valid_session
        expect(response).to redirect_to(Label.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved label as @label" do
        post :create, {:label => invalid_attributes}, valid_session
        expect(assigns(:label)).to be_a_new(Label)
      end

      it "re-renders the 'new' template" do
        post :create, {:label => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested label" do
        label = Label.create! valid_attributes
        put :update, {:id => label.to_param, :label => new_attributes}, valid_session
        label.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested label as @label" do
        label = Label.create! valid_attributes
        put :update, {:id => label.to_param, :label => valid_attributes}, valid_session
        expect(assigns(:label)).to eq(label)
      end

      it "redirects to the label" do
        label = Label.create! valid_attributes
        put :update, {:id => label.to_param, :label => valid_attributes}, valid_session
        expect(response).to redirect_to(label)
      end
    end

    context "with invalid params" do
      it "assigns the label as @label" do
        label = Label.create! valid_attributes
        put :update, {:id => label.to_param, :label => invalid_attributes}, valid_session
        expect(assigns(:label)).to eq(label)
      end

      it "re-renders the 'edit' template" do
        label = Label.create! valid_attributes
        put :update, {:id => label.to_param, :label => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested label" do
      label = Label.create! valid_attributes
      expect {
        delete :destroy, {:id => label.to_param}, valid_session
      }.to change(Label, :count).by(-1)
    end

    it "redirects to the labels list" do
      label = Label.create! valid_attributes
      delete :destroy, {:id => label.to_param}, valid_session
      expect(response).to redirect_to(labels_url)
    end
  end

end
