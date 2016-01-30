require 'rails_helper'

#Describes the subject of spec
RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
# #2 - call the index METHOD of WelcomeController
      get :index
# #3 - expects the controller's response to render INDEX template.
#2 and 3 are part of one test!
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET faq" do
    it "renders the faq template" do
      get :faq
      expect(response).to render_template("faq")
    end
  end

end