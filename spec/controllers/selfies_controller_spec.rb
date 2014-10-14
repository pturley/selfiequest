require 'rails_helper'

RSpec.describe SelfiesController, :type => :controller do
  let(:valid_attributes) {
    {image_file_size: "400"}
  }

  let(:invalid_attributes) {
    {}
  }

  before do
    @quest = create(:quest)
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:authenticate_quest_for_user!)
  end

  describe "GET index" do
    it "assigns all selfies as @selfies" do
      selfie = create(:selfie, quest: @quest)
      get :index, {quest_id: @quest.id}
      expect(assigns(:selfies)).to eq([selfie])
    end
  end

  describe "GET show" do
    it "assigns the requested selfie as @selfie" do
      selfie = create(:selfie, quest: @quest)
      get :show, {quest_id: @quest.id, id: selfie.to_param}
      expect(assigns(:selfie)).to eq(selfie)
    end
  end

  describe "GET new" do
    it "assigns a new selfie as @selfie" do
      get :new, {quest_id: @quest.id}
      expect(assigns(:selfie)).to be_a_new(Selfie)
    end
  end

  describe "GET edit" do
    it "assigns the requested selfie as @selfie" do
      selfie = create(:selfie, quest: @quest)
      get :edit, {quest_id: @quest.id, id: selfie.to_param}
      expect(assigns(:selfie)).to eq(selfie)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Selfie" do
        expect {
          post :create, {quest_id: @quest.id, selfie: valid_attributes}
        }.to change(Selfie, :count).by(1)
      end

      it "assigns a newly created selfie as @selfie" do
        post :create, {quest_id: @quest.id, selfie: valid_attributes}
        expect(assigns(:selfie)).to be_a(Selfie)
        expect(assigns(:selfie)).to be_persisted
      end

      it "redirects to the created selfie" do
        post :create, {quest_id: @quest.id, selfie: valid_attributes}
        expect(response).to redirect_to([@quest, Selfie.last])
      end
    end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved selfie as @selfie" do
    #     post :create, {:selfie => invalid_attributes}
    #     expect(assigns(:selfie)).to be_a_new(Selfie)
    #   end

    #   it "re-renders the 'new' template" do
    #     post :create, {:selfie => invalid_attributes}
    #     expect(response).to render_template("new")
    #   end
    # end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        build(:selfie, quest: @quest).attributes
      }

      # it "updates the requested selfie" do
      #   selfie = Selfie.create! valid_attributes
      #   put :update, {:id => selfie.to_param, :selfie => new_attributes}
      #   selfie.reload
      #   skip("Add assertions for updated state")
      # end

      it "assigns the requested selfie as @selfie" do
        selfie = create(:selfie, valid_attributes)
        put :update, {quest_id: @quest.id, id: selfie.to_param, selfie: valid_attributes}
        expect(assigns(:selfie)).to eq(selfie)
      end

      it "redirects to the selfie" do
        selfie = create(:selfie, valid_attributes)
        put :update, {quest_id: @quest.id, id: selfie.to_param, selfie: valid_attributes}
        expect(response).to redirect_to([@quest, selfie])
      end
    end

    # describe "with invalid params" do
    #   it "assigns the selfie as @selfie" do
    #     selfie = Selfie.create! valid_attributes
    #     put :update, {:id => selfie.to_param, :selfie => invalid_attributes}
    #     expect(assigns(:selfie)).to eq(selfie)
    #   end

    #   it "re-renders the 'edit' template" do
    #     selfie = Selfie.create! valid_attributes
    #     put :update, {:id => selfie.to_param, :selfie => invalid_attributes}
    #     expect(response).to render_template("edit")
    #   end
    # end
  end

  describe "DELETE destroy" do
    it "destroys the requested selfie" do
      selfie = create(:selfie, quest: @quest)
      expect {
        delete :destroy, {quest_id: @quest.id, id: selfie.to_param}
      }.to change(Selfie, :count).by(-1)
    end

    it "redirects to the selfies list" do
      selfie = create(:selfie, quest: @quest)
      delete :destroy, {quest_id: @quest.id, id: selfie.to_param}
      expect(response).to redirect_to(quest_selfies_url(@quest))
    end
  end

end
