class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @tasks = @user.tasks
      @projects = @user.projects
    else
      @tasks = Task.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

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
    end
    @task = @user.tasks.new
    respond_to do |format|
      @task.save
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
    if params[:username]
      @user = User.find_by_displayname(params[:user_id])
#This was here before      @task = Task.new(params[:task])
      @task = @user.tasks.create(params[:task])
      @projects = @user.projects.all
    else
      @task = Task.new(params[:task])
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
        format.html { redirect_to user_task_path(@user.displayname, @task), notice: 'Task saved.' }
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
    end
  end
end
