require 'rails_helper'

RSpec.describe CocktailsController, type: :controller do

  let(:cocktail) {FactoryGirl.create(:cocktail)}

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "instantiates a new cocktail instance variable" do
      get :new
      expect(assigns(:cocktail)).to be_a_new(Cocktail)
    end
  end

  describe "#create" do

    context "with valid attributes" do
      def valid_request
        post :create, cocktail: FactoryGirl.attributes_for(:cocktail)
      end

      it "saves a record to database" do
        count_before = Cocktail.count
        valid_request
        count_after = Cocktail.count
        expect(count_after).to eq(count_before + 1)
      end

      it "redirects to the show page of the cocktail" do
        valid_request
        expect(response).to redirect_to(cocktail_path(Cocktail.last))
      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "with invalid attributes" do
      def invalid_request
        post :create, cocktail: { name: ""}
      end
      it "doesnt save a record to the database" do
        count_before = Cocktail.count
        invalid_request
        count_after = Cocktail.count
        expect(count_after).to eq(count_before)
      end
      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end
      it "shows a flash message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end
end
