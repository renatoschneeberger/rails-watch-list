class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params) # Initiate new bookmark
    @bookmark.list = @list
    @movie = Movie.find(params[:bookmark][:movie_id])
    puts "maaaaaa"
    puts @movie
    puts @list
    puts @bookmark
    @bookmark.movie = @movie
    @bookmark.save! # save new bookmark
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end

end
