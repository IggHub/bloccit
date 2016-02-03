require 'rails_helper'

RSpec.describe Answer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:answers) {Question.create!(title: "New Answer Title", body: "New Answer Body")}
  let(:questions) {Answer.create!(body: 'Question Body', questions: post, resolved: false)}

  describe "attributes" do
    it "responds to body" do
      expect(answers).to respond_to(:body)
    end
  end
end
