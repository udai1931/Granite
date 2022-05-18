class TasksController < ApplicationController
  before_action :load_task!, only: %i[show update]  
  
  def index
    tasks = Task.all
    render status: :ok, json: {tasks: tasks}
  end

  def show 
    respond_with_json({ task: @task})
  end

  def create
    task = Task.new(task_params)
    task.save!
    respond_with_success(t("successfully_created"))
  end

  def update
    puts task_params
    # @task.update!(task_params)
    # respond_with_success(t("successfully_updated"))
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end

    def load_task!
      @task = Task.find_by!(params[:id])
    end

end
