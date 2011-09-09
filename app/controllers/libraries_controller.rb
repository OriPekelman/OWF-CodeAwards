class LibrariesController < ApplicationController
  def index                          
    @libs = Project.libraries
    respond_to do |format|
      format.html
      format.json { render json: @libs }
    end
  end
end
