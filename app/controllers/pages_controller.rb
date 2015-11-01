class PagesController < ApplicationController

  layout "admin"

  def index
    @page = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => "Page Title"})
  end

  def create
    @page = Page.new(page_params)
    if @page.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Page '#{@page.name}' created successfully"
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page '#{@page.name} updated successfully"
      redirect_to(:action => 'show', :id => @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{@page.name}' deleted successfully"
    redirect_to(:action => 'index')
  end


private
  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visable, :subject_id)
  end

end
