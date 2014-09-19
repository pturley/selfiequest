require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET login" do
    it "sets the user cookie if the user is valid" do
      user = create(:user)

      get :login, id: user.to_param

      expect(cookies[:user]).to eq user.to_param
    end

    it "raises an error if the user doesnt exist" do
      param = "1-anything"
      expect {
        get :login, id: param
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it "doesnt set the user cookie if the user doesnt have the correct id" do
      user = create(:user)
      param = "#{user.id}-Somebodyelse"

      get :login, id: param

      expect(cookies[:user]).to be_nil
    end
  end
end
