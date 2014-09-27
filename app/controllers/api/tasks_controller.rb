class Api::TasksController < Api::BaseController
  
  def update
    task = Task.find(params[:task_id])
    permitted = params.permit(:status)
    task.update!(permitted)

    respond_empty_success
  end
end
