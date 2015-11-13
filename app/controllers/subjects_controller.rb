class SubjectsController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in
    
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using for parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Subject '#{@subject.name}' created successfully"
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    # Find it
    # Find an existing object using for parameters
    @subject = Subject.find(params[:id])
      @subject_count = Subject.count
  end

  def update
    # Update it
    # If the object updates
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
    # If update succeeds, redirect to the index action
      flash[:notice] = "Subject '#{@subject.name}' updated successfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
    # If update fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully"
    redirect_to(:action => 'index')
  end

  private
    def subject_params
      # Same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
        params.require(:subject).permit(:name, :position, :visable, :created_at)
    end
end
