class TasksController < ApplicationController
  respond_to :html
  # GET /tasks
  # GET /tasks.json
  def index
    @user = User.find_by_displayname(params[:user_id])
    @projects = @user.projects
    if params[:project_id] #if on the project#show page.
      @project_show = 1
      @project = @projects.find(params[:project_id])
      @searchtask = @project.tasks.search(params[:q])
      @tasks = @searchtask.result
      @tasks = @searchtask.result.where(:active => true, :complete => false) unless @searchtask.result.where(:active => true, :complete => false).empty?
    else
      @searchtask = @user.tasks.search(params[:q])
      @tasks = @searchtask.result
      @tasks = @searchtask.result.where(:active => true, :complete => false) unless @searchtask.result.where(:active => true, :complete => false).empty?
    end
    @task = @user.tasks.build
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      if params[:project_id]
        @project = @user.projects.find(params[:project_id])
        @task = @project.tasks.find(params[:id])
      else
        @task = @user.tasks.find(params[:id])
      end
    else
      @task = Task.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @user = User.find_by_displayname(params[:user_id])
    @projects = @user.projects.all
    if params[:project_id]
      @project_title = @user.projects.find(params[:project_id]).title
      @project = @user.projects.find(params[:project_id])
    end
    @task = @user.tasks.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @task = @user.tasks.find(params[:id])
      @projects = @user.projects.all
    else
      @task = Task.find(params[:id])
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @projects = @user.projects.all
      if params[:project_id]
        @project = @user.projects.find(params[:project_id])
        @task = @project.tasks.create(params[:task])
      else
        @task = @user.tasks.create(params[:task])
      end
    else
      @task = Task.new(params[:task])
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to params[:project_id] ? user_project_path(@user.displayname, @project) : user_tasks_path(@user.displayname), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @task = @user.tasks.find(params[:id])
    else
      @task = Project.find(params[:id])
    end

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to user_tasks_url, notice: 'Task saved.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to user_tasks_url }
      format.json { head :no_content }
      format.js {render :nothing => true}
    end
  end
end
