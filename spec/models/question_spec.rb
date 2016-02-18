require 'rails_helper'

RSpec.describe Question, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  let(:questions) {Question.new(title: "New question title!", body: "New question body", resolved: false )}

  it "should respond to title" do
    expect(question).to respond_to(:title)
  end

  it "should respond to body" do
    expect(question).to respond_to(:body)
  end

  it "should respond to resolved" do
    expect(question).to respond_to(:resolved)
  end
end
