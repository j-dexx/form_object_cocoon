class TaskListBuilder
  include ActiveModel::Model
  attr_accessor :name

  def task_list
    @task_list ||= TaskList.new(name: name)
  end

  # this is how cocoon determines what to send, can use association name to change them
  def self.reflect_on_association(association_name)
    TaskList.reflect_on_association(association_name)
  end

  # then cocoon will call build on this
  def tasks
    task_list.tasks
  end

  # how rails uses fields_for
  def tasks_attributes=(attributes)
    attributes.each do |i, task_params|
      tasks.build(task_params)
    end
  end

  def save
    ActiveRecord::Base.transaction do
      task_list.save!
      tasks.each do |task|
        task.save!
      end
    end
  end
end
