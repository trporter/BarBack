require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "sets a new user instance variable" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, user: {first_name: "torri", last_name: "porter", email: "torri.porter@yahoo.com"}
      end
      it "creates a new user record in the database" do
        # expect{valid_request}.to change {User.count}.by(1)
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to eq(count_before + 1)
      end
      it "redirects to the home page" do
        valid_request
        expect(response).to redirect_to(root_path)
      end
      it "sets a sessions user_id to the created user id" do
        valid_request
        expect(session[:user_id]).to eq(User.last.id)
      end
    end
    context "with invalid attributes" do
      def invalid_request
        post :create, user: {email: " "}
      end
      it "doesnt create a user record in the database" do
        count_before = User.count
        invalid_request
        count_after = User.count
        expect(count_after).to eq(count_before)
      end
      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end
end
