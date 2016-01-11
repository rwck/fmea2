class ProjectsController < ApplicationController
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    # @projects = Project.all
    if @user

      @projects = @user.projects
      @users = User.all

      @users.each do |u_name|
        puts "User's name is #{u_name.firstname} #{u_name.lastname}"
        puts @users
      end

      @projects.each do |proj|
        puts 'Project name is ' + proj.name
        puts 'Project user ID is ' + proj.user_id.to_s

        @user_name = @users.find(proj.user_id).firstname + " " + @users.find(proj.user_id).lastname
        puts "User name is " + @user_name.to_s
        puts
      end

      @all_users = User.all

      @all_users.each do |user|
        puts user
      end
    end


  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @users = User.all
    @project = @user.projects.build
  end

  # GET /projects/1/edit
  def edit
    @users = User.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @user.projects.build(project_params)
    # @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_project
      @project = @user.projects.find(params[:id])
      # @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
