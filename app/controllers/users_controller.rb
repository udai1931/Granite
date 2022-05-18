class UserController < ApplicationController

    def index
        users = User.select(:id, :name)
        render status: :ok, json: {users: users}
    end

end