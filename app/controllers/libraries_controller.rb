class LibrariesController < ApplicationController
  def index                          
    @libs = Project.libraries
    respond_to do |format|
      format.html            
      format.json { render json: @libs.map {|lib|  
       if (params[:term].present? && lib.downcase.include?(params[:term].downcase))  then        
         {'id'=> lib.downcase, 'label'=> lib, 'value'=> lib}     
         end  
      }.compact.sort_by { |my_item| my_item[:id] }}
    end
  end
end
