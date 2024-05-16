class AttendeesController < ApplicationController
  before_action :set_attendee, only: [:show, :update, :checkin, :print]

  def start

  end

  def results
    @attendee = Attendee.find_sole_by(id: params[:id], last_name: params[:last_name])

    if @attendee
      redirect_to action: 'confirm', id: params[:id]
    else
      redirect_to action: 'index'
    end
  end

  def list
    last_name = params[:last_name]
    checkedin = params[:checkedin]
    @attendees = Attendee.where('lower(last_name) LIKE lower(?)', "%" + last_name + "%")
                         .order(:last_name, :first_name)
    if checkedin != "show"
      @attendees = @attendees.where('checked_in IS NULL')
    end
     # buid: buid, first_name: first_name, last_name: last_name)
  end

  def to_print
    printed = params[:printed]
    @attendees = Attendee.where('checked_in IS NOT NULL').order(:checked_in)
    if printed != "show"
      @attendees = @attendees.where('printed IS NULL')
    end
  end

  def show


    # @attendee = attendee.find_sole_by(buid: params[:buid])
  end

  def update
    # @attendee = attendee.find_sole_by(buid: params[:buid])

    if params[:attendee][:height]
      @attendee.height = params[:attendee][:height]

      if @attendee.save
        redirect_to attendee_path(id: @attendee.id)
      else
        render :show
      end
    end
  end

  def checkin
    checkval = params[:checkin] == "clear" ? nil : Time.now
    @attendee.update(checked_in: checkval)
    redirect_to attendee_path(@attendee)
  end

  def print
    checkval = params[:print] == "clear" ? nil : Time.now
    @attendee.update(printed: checkval)
    redirect_to attendee_path(@attendee, print: true)
  end

  def get_print_html
    printed = params[:printed]
    @attendees = Attendee.where('checked_in IS NOT NULL').order(:checked_in)
    if printed != "show"
      @attendees = @attendees.where('printed IS NULL')
    end
    html_string = render_to_string partial: 'print_list', locals: { attendees: @attendees }
    render html: html_string
  end

  private

  def set_attendee
    @attendee = Attendee.find_sole_by(id: params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:height)
  end

end
