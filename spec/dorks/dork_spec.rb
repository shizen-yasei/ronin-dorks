require 'spec_helper'
require 'ronin/dorks/dork'

describe Dorks::Dork do
  context "default" do
    before(:all) do
      @dork = Dorks::Dork.new
    end

    it "should have a pause value greater than 0" do
      Dorks::Dork.pause.should > 0
    end

    describe "dork" do
      it "should be exposed for debugging purposes" do
        @dork.should respond_to(:dork)
      end

      it "should return an empty Array" do
        @dork.dork.should == []
      end
    end

    it "should have no results" do
      @dork.should be_empty
    end
  end
end
