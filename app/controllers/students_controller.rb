class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy visit_update]
  before_action :redirect, only: %i[index show destroy]
  before_action :set_sidebar

  # GET /students or /students.json
  def index
    @students = Student.all
    @teams = Team.all
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv }
      format.xls # { send_data @students.to_csv(col_sep: "\t") }
    end
  end

  # GET /students/1 or /students/1.json
  def show
    # @event = Event.find(params[:event_id])
    respond_to do |format|
      format.js { render nothing: true }
      format.html
    end
  end

  # GET /students/new
  def new
    @student = Student.new
    @event = Event.find(params[:event_id])
    @teams = Team.all
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  # GET /students/1/edit
  def edit; end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
    @event = Event.find(@student.event_id)
    respond_to do |format|
      if @student.save

        format.json { render :show, status: :created, location: @student }
        id = SecureRandom.hex(4).to_s + @student.id.to_s + SecureRandom.hex(5).to_s
        @student.qrcode = id
        @student.save
        format.js { render nothing: true }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def visit_update
    if @student.visit
      @student.update(visit: false)
    else
      @student.update(visit: true)
    end
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  private

  def set_sidebar
    @show_sidebar = true
  end

  def redirect
    if account_signed_in?
      nil
    else
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:event_id, :second_name, :first_name, :email, :group, :faculty, :bilet, :phone, :vk_id, :visit, :team_id)
  end
end
