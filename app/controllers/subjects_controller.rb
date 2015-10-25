class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using for parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    # Find an existing object using for parameters
    @subject = Subject.find(params[:id])
    # If the object updates
    if @subject.update_attributes(subject_params)
    # If update succeeds, redirect to the index action
      redirect_to(:action => 'show', :id => @subject.id)
    else
    # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
  end

  private
    def subject_params
      # Same as using "params[:subject]", except that it:
      # - raises an error is :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visable)
    end
end
