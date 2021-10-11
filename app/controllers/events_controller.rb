class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy activation show_students get_preview]
  before_action :authenticate_account!, only: %i[new edit create destroy show_students]
  before_action :set_sidebar, except: %i[show]

  # GET /events or /events.json
  def index
    @events = Event.all
    @active_events = Event.active
    @preview_events = Event.preview
    @events_archive = Event.archive
  end

  def show_students
    @students = Student.where('event_id = ?', @event.id)
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv }
      format.xls
      format.js
    end
    @student = Student.new
  end

  # GET /events/1 or /events/1.json
  def show
    @student = Student.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.account_id = current_account.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def activation
    if @event.activation
      @event.update(activation: false)
      @event.update(preview: true)
    else
      @event.update(activation: true)
      @event.update(preview: false)
    end
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  def get_preview
    if @event.preview
      @event.update(activation: false)
      @event.update(preview: false)
    else
      @event.update(preview: true)
    end
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sidebar
    @show_sidebar = true
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:name, :information, :place, :advice, :begin_date, :end_date, :photo, :photo_cache, :solo)
  end
end
