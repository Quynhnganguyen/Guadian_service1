class HomeController < ApplicationController
  def index
  end

  def new_entry
    @entry = Entry.new
  end

  def save_entry
    binding.pry
  end
end
