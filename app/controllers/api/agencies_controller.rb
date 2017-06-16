class Api::AgenciesController < ApplicationController

  def index
    filter_hash = params.select { |k,v| k == "name" || k == 'tag'}
    agencies = Agency.search filter_hash
    unless agencies.blank?
      render json: agencies
    else
      render json: {error: 'No agency found'}, status: :not_found
    end
  end

  def create
    agency = Agency.new(agency_params)
    params[:tags].split(',').each do |tag|
      agency.tags.build(name: tag)
    end
    if agency.save
      render json: { agency: agency }
    else
      render json: { error: agency.errors.full_messages}, status: :bad_request
    end
  end

  private
  
  def agency_params
    params.require(:agency).permit(:name, :description, :grade)
  end
   
end
