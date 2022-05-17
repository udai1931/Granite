class TasksController < ApplicationController
  # respond_to :html, :xml, :json  
  
  def index
    tasks = Task.all
    render status: :ok, json: {tasks: tasks}
  end

  def show 
    @task = Task.find_by(slug: params[:slug])
  end
end
