class BookmarksController < ApplicationController
before_action :find_bookmark, only: :destroy

  def new
    @list = List.find(params[:list_id])
    # Is it because of nested ?
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      # what is the difference between .save & .save!
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
    # redirect_to lists_path
  end

  private


  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)

  end
end
