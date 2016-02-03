require 'rails_helper'

RSpec.describe Question, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:questions){ Question.create!(title: "New Question Title", body: "New Question Body")}

  describe "attributes" do

    it "responds to title" do
      expect(questions).to respond_to(:title)
    end

    it "responds to body" do
      expect(questions).to respond_to(:body)
    end

    it "responds to resolved" do
      expect(questions).to respond_to(:resolved)
    end
  end
end
