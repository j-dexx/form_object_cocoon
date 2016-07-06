class TaskListBuildersController < ApplicationController
  def new
    @task_list_builder = TaskListBuilder.new
  end

  def create
    @task_list_builder = TaskListBuilder.new(task_list_builder_params)
    if @task_list_builder.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def task_list_builder_params
    params.require(:task_list_builder).permit(:name, tasks_attributes: [:name])
  end
end
