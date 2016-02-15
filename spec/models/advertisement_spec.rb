require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  #  pending "add some examples to (or delete) #{__FILE__}"
    let(:advertisement){ Advertisement.create!  }

    describe "attributes" do

      it "responds to title" do
        expect(advertisement).to respond_to(:title)
      end

      it "responds to copy" do
        expect(advertisement).to respond_to(:copy)
      end

      it "responds to price $$" do
        expect(advertisement).to respond_to(:price)
      end
    end

  
end
