class SubjectsController < ApplicationController
  before_action :confirm_logged_in  

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({title: "Default"})
  end
  
  def destroy
    Subject.find(params[:id]).destroy
    redirect_to action: "index"
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    @subject = Subject.find(params[:id])
      if @subject.update_attributes(subject_params)
        flash[:success] = "Subject обновлен"
        redirect_to action: "index"
      else
        render 'edit'
      end
    
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Тема создана успешно."
      redirect_to(action: 'index')
    else
      @subject_count = Subject.count + 1
      render 'new'
    end
  end

private
    def subject_params
      params.require(:subject).permit(:title, :position, :visible, :created_at)
    end

end