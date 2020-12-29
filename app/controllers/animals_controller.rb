class AnimalsController < ApplicationController


    def index
        # animals = Animal.includes(:sights).all
        animals = Animal.all
        # render :json => animals.to_json(:include => :sights )
        render json: animals

    end

    def show
    #     # animal = Animal.find(params[:id])
    #     # sight = Sight.find(params[:id])
    #     # animal = animal.push(sight)
    #     # animal.merge(sight)

        animal = Animal.find(params[:id])
        # format.json { render json: animal.as_json(:include => :sights) }
        # format.json { render json: animal.to_json(include: :sights)}
        render :json => animal.to_json(:include => :sights )

        # render json: animal
    end

    # def show
    #     # animal = Animal.find(params[:id])
    
    #     # respond_to do |value|
    #     #   value.json { render json: animal }
    #     # end

    #     animal = Animal.find(params[:id]).joins(:sights)
    #     render json: animal

    # end


    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            # render json: animal.errors
            render json: animal.errors, status: :unprocessable_entity
        end

    rescue ActiveRecord::RecordNotFound
        render json: { error: error.message }, status: :not_found
    
end


    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end

    def update
        animal = Animal.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end



    private
    def animal_params
        params.require(:animal).permit(:name, :latin, :kingdom, sights_attributes: [ :id, :date, :latitude, :longitude ] )
    end
    

end
