# This controller is responsible for handling the CRUD actions for the flashcards.
module Api
  module V1
    class FlashcardsController < ApplicationController

      def index
        @flashcards = @user.flashcards
        render json: @flashcards, include: :categories
      end

      def show
        @flashcard = @user.flashcards.find(params[:id])
        render json: @flashcard, include: :categories
      end

      def create
        logger.debug "Creating flashcard..."
        logger.debug "User: #{@user.email}"
        logger.debug "Flashcard params: #{flashcard_params}"
        @flashcard = @user.flashcards.new(flashcard_params)
        flashcard_categories = params[:flashcard][:categories]

        if @flashcard.save
          flashcard_categories.each do |category_id|
            @flashcard.flashcard_categories.create(category_id: category_id)
          end
          render json: @flashcard, status: :created
        else
          render json: @flashcard.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @flashcard = @user.flashcards.find(params[:id])
        @flashcard.destroy
      end

      private

      def flashcard_params
        params.require(:flashcard).permit(:foreign, :maternal)
      end
    end
  end
end
