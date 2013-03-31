class HomeController < ApplicationController
  def index
  end

  def new_entry
  end

  def save_entry
    entry = Entry.new(params[:entry])
    entry.check_in_at = Time.now
    entry.save
    redirect_to :back, notice: 'created entry'
  end
end
