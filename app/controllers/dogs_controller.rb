class DogsController < ApplicationController
    before_action :find_dog, only: [:show, :edit, :update, :destory]

    def index
        @dogs = Dog.all
    end

    def show
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.create(dog_params)

        redirect_to dog_path(@dog)
    end

    def edit

    end
   
    def update
        @dog.update(params.require(:dog).permit(:name, :breed, :age))

        redirect_to dog_path(@dog)
    end

    def destory
        @dog.destory
        redirect_to dogs_path
    end

    
    private

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def find_dog
        @dog = Dog.find(params[:id])
    end
end
