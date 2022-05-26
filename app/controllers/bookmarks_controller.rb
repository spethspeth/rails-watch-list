class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    @bookmark.movie = Movie.find(bookmark_params[:movie_id])
    @bookmark.save ? (redirect_to list_path(@bookmark.list)) : (render :new)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.delete
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
