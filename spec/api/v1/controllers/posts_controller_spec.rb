require 'rails_helper'

 RSpec.describe Api::V1::PostsController, type: :controller do
   let(:my_user) { create(:user) }
   let(:other_user) {create(:user)}
   let(:my_topic) { create(:topic) }
   let(:my_post) {create(:post, topic: my_topic, user: my_user)}
   let(:my_comment) { Comment.create!(body: 'Comment Body', post: my_post, user: my_user) }

   context "unauthenticated user" do
=begin     it "GET index returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "GET show returns http success" do
       get :show, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it "GET show returns child comments" do
       get :show, id: my_post.id
       response_hash = JSON.parse response.body
       expect(response_hash['comments']).to_not be_nil
     end
=end
     it "PUT update returns http unauthenticated" do
       put :update, topic_id: my_topic.id, id: my_post.id, post: {title: my_post.title, body: my_post.body}
       expect(response).to have_http_status(401)
     end

   end

   context "unauthorized user" do
     before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end

     it "GET index returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "GET show returns http success" do
       get :show, id: my_post.id
       expect(response).to have_http_status(:success)
     end

     it "GET show returns child comments" do
       get :show, id: my_post.id
       response_hash = JSON.parse response.body
       expect(response_hash['comments']).to_not be_nil
     end
   end
 end