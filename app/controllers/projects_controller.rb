class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @projects = @user.projects
    else
      @projects = Project.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @projects = @user.projects
      @project = @user.projects.find(params[:id])
      @tasks = @project.tasks
      @journals = @project.journals
      @project_show = 1
    else
      @project = Project.find(params[:id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @user = User.find_by_displayname(params[:user_id])
    @project = @user.projects.new
    @projects = @user.projects

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @project = @user.projects.find(params[:id])
      @projects = @user.projects
    else
    @project = Project.find(params[:id])
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    if params[:user_id]
      @user = User.where(:displayname => params[:user_id]).first
      @project = @user.projects.create(params[:project])
    else
      @project = Project.new(params[:project])
    end
    respond_to do |format|
      if @project.save
        format.html { redirect_to user_project_path(@user.displayname, @project), notice: 'Project was successfully created.' }
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
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @project = @user.projects.find(params[:id])
    else
      @project = Project.find(params[:id])
    end
    @project.update_attributes(params[:project])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { 
          if request.xhr?
            render :text => params[:project].values.first
          else
            redirect_to(user_projects_url(@user.displayname), notice: 'Project was successfully updated.')
          end
         }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to user_projects_url }
      format.json { head :no_content }
    end
  end
end
