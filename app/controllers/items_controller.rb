class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: e, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: e, status: :unprocessable_entity
  end

  def index
    @todo = Todo.find params[:todo_id]
    render json: @todo.items, status: :ok
  end

  def show
    @item = Item.find params[:id]
    render json: @item, status: :found
  end

  def create
    @todo = Todo.find params[:todo_id]
    @item = @todo.items.create! item_params
    render json: @item, status: :created
  end

  def update
    @item = Item.find params[:id]
    @item.update_attributes item_params
    render json: @item, status: :no_content
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    render json: @item, status: :no_content
  end

  private

  def item_params
    params.require(:item).permit :name
  end
end
