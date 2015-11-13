class PublicController < ApplicationController

  layout 'public'
    before_action :setup_navigation
    
  def index

      # Intro text
  end

  def show
      @page = Page.where(:permalink => params[:permalink], :visable => true).first
      if @page.nil?
          redirect_to(:action => 'index')
      else
          # Display page content using show.html.erb
      end
      
  end
    
    private
    
    def setup_navigation
      @subjects =Subject.visable.sorted
    end
    
end
