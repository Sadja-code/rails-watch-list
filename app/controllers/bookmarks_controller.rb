class BookmarksController < ApplicationController
  before_action :set_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: "Signet ajouté avec succès !"
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: "Signet supprimé avec succès !", status: :see_other
  end

  private 

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment,:movie_id,:list_id)
  end
end
