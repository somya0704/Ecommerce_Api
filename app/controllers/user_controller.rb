class UserController < ApplicationController
    def update
        user = current_user
    
        if user.update(user_params)
          render json: user, status: 200, location: [:api, user]
        else
          render json: { errors: user.errors }, status: 422
        end
      end
      def destroy
        current_user.destroy
        head 204
      end
end
