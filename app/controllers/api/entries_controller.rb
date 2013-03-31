class Api::EntriesController < ApplicationController
  before_filter :authenticate_user!, only: [:check_in]

  def check_in
    entry = Entry.new(params[:entry])
    entry.check_in_at = Time.now
    entry.user = current_user
    entry.save
    render json: entry
  end

  def show
    entry = Entry.where(tag: params[:tag], check_out_at: nil).first
    render json: entry
  end

  def check_out
    entry = Entry.where(tag: params[:tag], check_out_at: nil).first
    if (entry)
      entry.check_out_at = Time.now
      entry.save
      render json: entry
    else
      render text: 'entry not found'
    end
  end
end
