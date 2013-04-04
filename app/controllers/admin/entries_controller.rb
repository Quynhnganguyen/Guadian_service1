class Admin::EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def destroy

    @entry = Entry.find(params[:id]) 
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to admin_entries_url }
      format.json { head :no_content }
    end

  end



end
