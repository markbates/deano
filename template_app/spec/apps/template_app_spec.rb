require 'spec_helper'

describe TemplateApp do
  
  def app
    TemplateApp
  end

  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should match("TemplateApp!")
  end

end