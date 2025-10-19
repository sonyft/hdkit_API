class BodygraphsController < ApplicationController
  def index
    @bodygraphs = BodygraphRecord.order(created_at: :desc).limit(10)
  end

  def show
    @bodygraph = BodygraphRecord.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Bodygraph не е намерен'
  end

  def new
    @bodygraph = Bodygraph.new
  end

  def create
    @bodygraph = Bodygraph.new(bodygraph_params)

    if @bodygraph.valid?
      begin
        # Prepare API request parameters
        api_params = {
          name: @bodygraph.name,
          birth_date: @bodygraph.birth_date,
          birth_time: @bodygraph.birth_time,
          birth_country: @bodygraph.birth_country,
          birth_city: @bodygraph.birth_city
        }

        # Call the API
        api_response = BodygraphApiService.generate_bodygraph(api_params)

        # Create bodygraph record in database
        bodygraph_record = BodygraphRecord.from_api_response(api_response)

        redirect_to bodygraph_path(bodygraph_record), notice: 'Bodygraph генериран успешно!'
      rescue => e
        flash.now[:alert] = "Грешка при генериране на bodygraph: #{e.message}"
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bodygraph_params
    params.require(:bodygraph).permit(:name, :birth_date, :birth_time, :birth_country, :birth_city)
  end
end
