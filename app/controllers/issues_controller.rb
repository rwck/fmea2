class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_project
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    # @issues = Issue.all
    # @issues = @project.issues.all

    # This shows only the issues belonging to projects belonging to the current user.

    @issues = Issue.order(risk_level: :desc).joins(:project).where('projects.user_id': current_user.id)

    # @issues = Issue.joins(:project).where('projects.user_id': current_user.id)
    #
    @project = @project
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    # @issue = Issue.new
    @issue = @project.issues.build
    @user = current_user
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params['id'])
    @user = current_user
  end

  # POST /issues
  # POST /issues.json
  def create
    # @issue = Issue.new(issue_params)
    @issue = @project.issues.build(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = current_user
  end

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def set_project
    if params[:project_id]
      @project = @user.projects.find(params[:project_id])
    else
      @message = "You have no issues. Good news indeed."
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.

  def issue_params
  params.require(:issue).permit(:item, :function, :failure, :effect_of_failure, :cause_of_failure, :current_controls, :recommended_actions, :probability_estimate, :severity_estimate, :detection_indicators, :detection_dormancy_period, :risk_level, :further_investigation, :project_id)
  end
end
