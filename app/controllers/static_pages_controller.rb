class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def show
    @page = Page.where(:link => params[:link], :visible => true).first
    if @page.nil?
      redirect_to(:action => 'index')
    else
      # Показываем содержимое show.html.erb
    end
  end

end
