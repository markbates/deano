require 'spec_helper'

describe MyApp do
  
  def app
    MyApp
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should match("Hello World!")
  end

end