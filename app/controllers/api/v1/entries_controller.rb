module Api
  module V1
    class EntriesController < ApplicationController
      before_action :ensure_current_user, except: [:index]

      def index
        render json: Entry.all.map(&:as_json)
      end

      def create
        entry = Entry.new_from_url(params[:entry][:url])
        entry.user_id = current_user.id
        if entry.save
          render json: entry
        else
          render entry.errors, status: 422
        end
      end

      def show
        entry = Entry.where(id: params[:id]).first
        if entry
          render json: entry
        else
          head 404
        end
      end

      def update
      end

      def destroy
      end

      private

      def entry_params
        params.require(:entry).permit(:id, :description, :share_link, :edit_link, :embed_code)
      end

      def ensure_current_user
        unless current_user.present?
          return head 401
        end
      end

    end
  end
end
