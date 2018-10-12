class PagesController < ApplicationController
  def about
  end

  def search
    @search_results = Character.where('name LIKE ?', "%#{params[:query]}%")
                           .order(:name)
                           .page params[:page]
  end
end
