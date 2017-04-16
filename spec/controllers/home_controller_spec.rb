require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "index" do
    it "has a 200 status" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "create" do
    xit "test" do
    end
  end
end
