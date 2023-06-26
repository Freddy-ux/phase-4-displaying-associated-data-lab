require 'rails_helper'

RSpec.describe "Items", type: :request do
  let!(:user) do
    User.create(username: "Dwayne", city: "Los Angeles")
  end

  let!(:item) do
    user.items.create(name: "Non-stick pan", description: "Sticks a bit", price: 10)
  end

  describe "GET /items" do
    it 'returns an array of all items with user info' do
      get '/items'

      expect(response.body).to include_json([
        { 
          id: a_kind_of(Integer), 
          name: "Non-stick pan", 
          description: "Sticks a bit", 
          price: 10,
          user: {
            id: user.id,
            username: "Dwayne",
            city: "Los Angeles"
          }
        }
      ])
    end
  end
end
