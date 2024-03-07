class FlightsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if(params_valid(params))
        source_city = params[:sourceCity]
        destination_city = params[:destinationCity]
        travel_date = Date.parse(params[:travelDate])
        return_flight = params[:returnDate]
        flights = search_flights(source_city, destination_city, travel_date)
        return_flights = []
        if(return_flight.present?)
            return_flights = search_flights(destination_city, source_city, return_flight)
        end
        render json: { flights: flights, total_results: flights.count , return_flights: return_flights}
        else
            head :unprocessable_entity
        end
    end

    private

    def params_valid(params)
        return params[:sourceCity].present? && params[:destinationCity].present? && params[:travelDate].present?
    end

    def search_flights(source_city, destination_city, travel_date)
        return Flight.where("source_city = ? AND destination_city = ? AND DATE(departure_time) = ?", source_city, destination_city, travel_date)
    end
  end
  