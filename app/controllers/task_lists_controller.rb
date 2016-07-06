class TaskListsController < ApplicationController
  def index
    @task_lists = TaskList.includes(:tasks)
  end
end
