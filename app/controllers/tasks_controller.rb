class TasksController < ApplicationController
  # respond_to :html, :xml, :json  
  
  def index
      tasks = Task.all
      render status: :ok, json: {tasks: tasks}
    end
end
