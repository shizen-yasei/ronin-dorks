require 'ronin/dorks/version'

require 'spec_helper'

describe Dorks do
  it "should have a version" do
    Dorks.const_defined?('VERSION').should == true
  end
end
