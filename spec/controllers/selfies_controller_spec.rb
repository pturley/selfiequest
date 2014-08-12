require 'rails_helper'

RSpec.describe SelfiesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Selfie. As you add validations to Selfie, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {}
  }

  let(:invalid_attributes) {
    {}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all selfies as @selfies" do
      selfie = Selfie.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:selfies)).to eq([selfie])
    end
  end

  describe "GET show" do
    it "assigns the requested selfie as @selfie" do
      selfie = Selfie.create! valid_attributes
      get :show, {:id => selfie.to_param}, valid_session
      expect(assigns(:selfie)).to eq(selfie)
    end
  end

  describe "GET new" do
    it "assigns a new selfie as @selfie" do
      get :new, {}, valid_session
      expect(assigns(:selfie)).to be_a_new(Selfie)
    end
  end

  describe "GET edit" do
    it "assigns the requested selfie as @selfie" do
      selfie = Selfie.create! valid_attributes
      get :edit, {:id => selfie.to_param}, valid_session
      expect(assigns(:selfie)).to eq(selfie)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Selfie" do
        expect {
          post :create, {:selfie => valid_attributes}, valid_session
        }.to change(Selfie, :count).by(1)
      end

      it "assigns a newly created selfie as @selfie" do
        post :create, {:selfie => valid_attributes}, valid_session
        expect(assigns(:selfie)).to be_a(Selfie)
        expect(assigns(:selfie)).to be_persisted
      end

      it "redirects to the created selfie" do
        post :create, {:selfie => valid_attributes}, valid_session
        expect(response).to redirect_to(Selfie.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved selfie as @selfie" do
        post :create, {:selfie => invalid_attributes}, valid_session
        expect(assigns(:selfie)).to be_a_new(Selfie)
      end

      it "re-renders the 'new' template" do
        post :create, {:selfie => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {}
      }

      it "updates the requested selfie" do
        selfie = Selfie.create! valid_attributes
        put :update, {:id => selfie.to_param, :selfie => new_attributes}, valid_session
        selfie.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested selfie as @selfie" do
        selfie = Selfie.create! valid_attributes
        put :update, {:id => selfie.to_param, :selfie => valid_attributes}, valid_session
        expect(assigns(:selfie)).to eq(selfie)
      end

      it "redirects to the selfie" do
        selfie = Selfie.create! valid_attributes
        put :update, {:id => selfie.to_param, :selfie => valid_attributes}, valid_session
        expect(response).to redirect_to(selfie)
      end
    end

    describe "with invalid params" do
      it "assigns the selfie as @selfie" do
        selfie = Selfie.create! valid_attributes
        put :update, {:id => selfie.to_param, :selfie => invalid_attributes}, valid_session
        expect(assigns(:selfie)).to eq(selfie)
      end

      it "re-renders the 'edit' template" do
        selfie = Selfie.create! valid_attributes
        put :update, {:id => selfie.to_param, :selfie => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested selfie" do
      selfie = Selfie.create! valid_attributes
      expect {
        delete :destroy, {:id => selfie.to_param}, valid_session
      }.to change(Selfie, :count).by(-1)
    end

    it "redirects to the selfies list" do
      selfie = Selfie.create! valid_attributes
      delete :destroy, {:id => selfie.to_param}, valid_session
      expect(response).to redirect_to(selfies_url)
    end
  end

end
