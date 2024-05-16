class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :edit, :update, :checkin, :print, :destroy]

  def start

  end

  def results
    @attendee = Attendee.find_by(id: params[:id], last_name: params[:last_name])

    if @attendee
      redirect_to action: 'confirm', id: params[:id]
    else
      redirect_to action: 'index'
    end
  end

  def list
    last_name = params[:last_name]
    checkedin = params[:checkedin]
    @attendees = Attendee.where('lower(last_name) LIKE lower(?)', "%#{last_name}%")
                         .order(:last_name, :first_name)
    @attendees = @attendees.where('checked_in IS NULL') if checkedin != "show"
  end

  def to_print
    printed = params[:printed]
    @attendees = Attendee.where('checked_in IS NOT NULL').order(:checked_in)
    @attendees = @attendees.where('printed IS NULL') if printed != "show"
  end

  def show
    # @attendee = attendee.find_sole_by(buid: params[:buid])
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.new(attendee_params)
    if @attendee.save
      redirect_to @attendee, notice: 'Attendee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to @attendee, notice: 'Attendee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attendee.destroy
    redirect_to attendees_url, notice: 'Attendee was successfully destroyed.'
  end

  def checkin
    checkval = params[:checkin] == "clear" ? nil : Time.now
    if @attendee.update(checked_in: checkval)
      redirect_to attendee_path(@attendee)
    else
      flash[:error] = "Check-in failed."
      redirect_to attendee_path(@attendee)
    end
  end

  def print
    checkval = params[:print] == "clear" ? nil : Time.now
    @attendee.update(printed: checkval)
    redirect_to attendee_path(@attendee, print: true)
  end

  def get_print_html
    printed = params[:printed]
    @attendees = Attendee.where('checked_in IS NOT NULL').order(:checked_in)
    @attendees = @attendees.where('printed IS NULL') if printed != "show"
    html_string = render_to_string partial: 'print_list', locals: { attendees: @attendees }
    render html: html_string
  end

  private

  def set_attendee
    @attendee = Attendee.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :email, :phone_number, :ug_graduation_year, :ug_college, :ug_program, :ug_degree, :gr_graduation_year, :gr_college, :gr_program, :gr_degree, :is_faculty, :is_staff, :company, :position, :checked_in, :printed)
  end
  
end
