class DemoController < ApplicationController

  layout 'application'

  def index
  end

  def hello
  	# render(:template => 'demo/index')
  	@array = [1,2,3,4,5]
  	@id = params[:id].to_i
  	@page = params[:page].to_i
  end

  def other_hello
  	redirect_to(:controller => 'demo', :action => 'index')
  end
    
  def text_helpers
  end
    
  def escape_output
  end

  def make_error
    # render(:text => "test" #syntax error - missing closing bracket
    # render(:text => @something.upcase) # undefined method
    # render(:text => "1" + 1) # add string to integer
    logger.debug("this is a debug log message")
    logger.info("This is an Info log message")
    logger.warn("this is a Warn log message")
    logger.error("This is an Error log message")
    logger.fatal("This is a fatal log message")
    render(:text => 'Logged!')
  
  end

end
