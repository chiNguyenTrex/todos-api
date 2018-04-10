class TodosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: e, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: e, status: :unprocessable_entity
  end

  def index
    @todos = current_user.todos
    render json: @todos, status: :ok
  end

  def show
    @todo = Todo.find params[:id]
    render json: @todo, status: :found
  end

  def create
    @todo = current_user.todos.create! todo_params
    render json: @todo, status: :created
  end

  def update
    @todo = Todo.find params[:id]
    @todo.update_attributes todo_params
    render json: @todo
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit :name
  end
end
