class Api::AgenciesController < ApplicationController

  def index
    filter_hash = params.select { |k,v| k == "name" || k == 'tag'}
    agencies = Agency.search filter_hash
    render json: agencies
  end

  def create
    agency = Agency.new(agency_params)
    params[:tags].split(',').each do |tag|
      agency.tags.build(name: tag)
    end
    if agency.save
      render json: { agency: agency, status: :ok}
    else
      render json: { error: agency.errors.full_messages , status: :bad_request}
    end
  end

  private
  
  def agency_params
    params.require(:agency).permit(:name, :description, :grade)
  end
   
end
