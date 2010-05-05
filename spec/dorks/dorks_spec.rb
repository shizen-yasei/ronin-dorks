require 'spec_helper'
require 'ronin/dorks/version'

describe Dorks do
  it "should have a version" do
    Dorks.const_defined?('VERSION').should == true
  end
end
