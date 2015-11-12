class SectionController < ApplicationController

  layout "admin"
  before_action :confirm_logged_in
  before_action :find_page

  def index
    # @section = Section.sorted
    # @section = @page.section.sorted
      @section = Section.where(:page_id => @page.id).sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => "Section Title"})
    # @pages = Page.order('position ASC')
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save 
      flash[:notice] = "Section '#{@section.name}' created successfully"
        redirect_to(:action => 'index', :page_id => @page.id)
    else 
      @section_count = Section.count + 1
      @pages = Page.order('position ASC')
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order('position ASC')
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section '#{@section.name}' updated successfully"
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @section_count = Section.count
      @pages = Page.order('position ASC')
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{@section.name}' deleted successfully"
    redirect_to(:action => 'index', :page_id => @page.id)
  end

private
  def section_params
    params.require(:section).permit(:name, :page_id, :position, :visable, :content_type, :content)
  end

    
    def find_page
        if params[:page_id]
            @page = Page.find(params[:page_id])
        end
    end
    
end
