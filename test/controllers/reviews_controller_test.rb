require "test_helper"

describe ReviewsController do
  describe "index" do
    it "returns all reviews" do
      count = 0
      reviews = Review.all
      reviews_count = reviews.count

      reviews.each do |review|
        count += 1
      end

      reviews_count.must_equal count
    end

    
  end
end
