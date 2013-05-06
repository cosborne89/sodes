class JournalsController < ApplicationController
  # GET /journals
  # GET /journals.json
  def index
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @projects = @user.projects
      if params[:project_id]
        @journals = @projects.journals.all
      else
        @journals = @user.journals.all
      end
    else
      @journals = Journal.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @journals }
    end
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    @user = User.find_by_displayname(params[:user_id])
    if params[:project_id]
      @project = @user.projects.find(params[:project_id])
      @journal = @project.journals.find(params[:id])
    else
      @journal = @user.journals.find(params[:id])
      @projects = @user.projects
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @journal }
    end
  end

  # GET /journals/new
  # GET /journals/new.json
  def new
    @user = User.find_by_displayname(params[:user_id])
    @projects = @user.projects.all
    if params[:project_id]
      @project_title = @user.projects.find(params[:project_id]).title
      @project = @user.projects.find(params[:project_id])
    end
    @journal = @user.journals.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @journal }
    end
  end

  # GET /journals/1/edit
  def edit
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @journal = @user.journals.find(params[:id])
      @projects = @user.projects.all
    else
      @journal = Journal.find(params[:id])
    end
  end

  # POST /journals
  # POST /journals.json
  def create
    @user = User.find_by_displayname(params[:user_id])
    @projects = @user.projects.all
    if params[:project_id]
      @project = @user.projects.find(params[:project_id])
      @journal = @project.journals.create(params[:journal])
    else
      @journal = @user.journals.create(params[:journal])
     end
    respond_to do |format|
      if @journal.save
        format.html { redirect_to user_journals_url, notice: 'Journal was successfully created.' }
        format.json { render json: @journal, status: :created, location: @journal }
      else
        format.html { render action: "new" }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /journals/1
  # PUT /journals/1.json
  def update
    if params[:user_id]
      @user = User.find_by_displayname(params[:user_id])
      @journal = @user.journals.find(params[:id])
    else
      @journal = Journal.find(params[:id])
    end

    respond_to do |format|
      if @journal.update_attributes(params[:journal])
        format.html { redirect_to user_journals_url, notice: 'Journal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal = Journal.find(params[:id])
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to user_journals_url }
      format.json { head :no_content }
      format.js {render :nothing => true}
    end
  end
end
