class ListsController < ApplicationController
before_action :find_list, only:[:show, :edit, :destroy]
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    # @list = List.new
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
     if @list.save
      redirect_to lists_path
     else
      render 'index'
     end
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to lists_path
    # redirect_to lists_path
  end

  private
  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
