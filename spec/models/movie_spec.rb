require 'rails_helper'

RSpec.describe Movie, type: :model do
  
  describe "Validations" do 
    it "Validate presence of required fields" do 
      should validate_presence_of(:title_movie)
      should validate_presence_of(:movie_overview)
      should validate_presence_of(:vote_count)
      should validate_presence_of(:poster_path)
      should validate_presence_of(:release_date)
    end
  end  
end