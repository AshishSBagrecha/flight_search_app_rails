require 'rails_helper'

RSpec.describe FlightsController, type: :controller do
  describe "GET #index" do
    before do
      # Load seed data
      load Rails.root.join('db', 'seeds.rb')
      
      # Define parameters for the request
      source_city = "Bangalore"
      destination_city = "Mumbai"
      travel_date = "2024-03-07"
      
      # Make the request to the index action
      get :index, params: { sourceCity: source_city, destinationCity: destination_city, travelDate: travel_date }, format: :json
    end

    

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "returns JSON response with flights matching source city, destination city, and travel date" do
      json_response = JSON.parse(response.body)
      expect(json_response['flights'].map { |flight| flight['source_city'] }).to all(eq("Bangalore"))
      expect(json_response['flights'].map { |flight| flight['destination_city'] }).to all(eq("Mumbai"))
      expect(json_response['flights'].map { |flight| flight['departure_time'] }).to all(start_with("2024-03-07"))
    end

    context "with invalid parameters" do
        it "returns an error response if source city is missing" do
          get :index, params: { destinationCity: "Mumbai", travelDate: "2024-03-07" }, format: :json
          expect(response).to have_http_status(:unprocessable_entity)
        end
  
        it "returns an error response if destination city is missing" do
          get :index, params: { sourceCity: "Bangalore", travelDate: "2024-03-07" }, format: :json
          expect(response).to have_http_status(:unprocessable_entity)
        end
  
        it "returns an error response if travel date is missing" do
          get :index, params: { sourceCity: "Bangalore", destinationCity: "Mumbai" }, format: :json
          expect(response).to have_http_status(:unprocessable_entity)
        end
    end
  end
end
