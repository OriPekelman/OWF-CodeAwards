class ProjectsController < ApplicationController
before_filter :authenticate_user!, :except => [:index, :show, :search]
  # GET /projects
  # GET /projects.json
  def index     

    @projects = Project.all
    respond_to do |format|
      format.html {render :template => "projects/index"}
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

    @project = Project.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit             
      @project = Project.find_by_slug(params[:id])                   
    if (user_signed_in?  && @project.user == current_user ) ||(can? :manage, Project) 
      @project
    else                                                             
      redirect_to @project, notice: 'You can not change someone else\'s project' 
    end
  end

  # POST /projects
  # POST /projects.json
  def create            
#    @project = current_user.project.build(params[:project])
     @project = Project.new(params[:project])
     @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find_by_slug(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find_by_slug(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :ok }
    end
  end   
  
  def unvote
    @project = Project.find_by_slug(params[:id])
    current_user.unvote(@project)
    redirect_to project_path(@project), :notice => "Your unvote is successfully submitted."
  end

  def vote_up
    @project = Project.find_by_slug(params[:id])
    current_user.vote(@project, :up)
    redirect_to project_path(@project), :notice => "Your vote up is successfully submitted."
  end

  def vote_down
    @project = Project.find_by_slug(params[:id])
    current_user.vote(@project, :down)
    redirect_to project_path(@project), :notice => "Your vote down is successfully submitted."
  end

  def search
    keywords = params[:keywords] ||= ""
    if keywords.strip.blank?
      @projects = Project.all
    else
      @projects = Project.search(params[:keywords])
    end
    render :index, :layout => false
  end
  
end
