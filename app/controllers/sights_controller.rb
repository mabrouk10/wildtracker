class SightsController < ApplicationController

    def index
        # sights = Sight.where(date: params[:start_date])
        sights = Sight.where(date: params[:start_date]..params[:end_date])
        # sights = Sight.where(start_date: sight_params[:start_date]..sight_params[:end_date])

        render json: sights
        # https://www.somewebsite.com/?firstParam=value1&secondParam=value2
        # http://localhost:3000/sights?start_date=2020-12-23T00:00:00.000Z&end_date=2020-12-24T00:00:00.000Z
      end

    # def index
    #     sights = Sight.all
    #     render json: sights
    # end

    # def show
    #     sight = Sight.find(params[:id])
    #     render json: sight
    # end

    def create
        sight = Sight.create(sight_params)
        if sight.valid?
            render json: sight
        else
            render json: sight.errors
        end
    end

    def destroy
        sight = Sight.find(params[:id])
        if sight.destroy
            render json: sight
        else
            render json: sight.errors
        end
    end

    def update
        sight = Sight.find(params[:id])
        sight.update(sight_params)
        if sight.valid?
            render json: sight
        else
            render json: sight.errors
        end
    end

    private
    def sight_params
        params.require(:sight).permit(:latitude, :longitude, :date, :start_date, :end_date)
    end

end
