require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let (:my_topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let (:my_sponsored_post) {my_topic.sponsored_post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}
#note: sponsored_post on my_topic.sponsored_post is equal to the variable @sponsored_post assigned on sponsored_posts_controller
  describe "GET index" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
  end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template(:success)
    end

    it "assigns my_sponsored_post to @sponsored_post" do
      expect(assigns(:sponsored_post)).to eq (my_sponsored_post)
    end
  end
end
