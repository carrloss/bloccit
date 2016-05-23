require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sponsoredpost) {SponsoredPost.create!(title: "Sponsoredpost title", body: "Sponsoredpost body", price: 10) }

  describe "attributes" do
    it "has title, body, and price attributes" do
      expect(sponsoredpost).to have_attributes(title: "Sponsoredpost title", body: "Sponsoredpost body", price: 10)
    end
  end
end
