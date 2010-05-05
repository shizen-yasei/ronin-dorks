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

    describe "new_query" do
      it "should be exposed for debugging purposes" do
        @dork.should respond_to(:new_query)
      end

      it "should return an empty Array" do
        @dork.new_query.should == []
      end
    end

    it "should have no results" do
      @dork.should be_empty
    end
  end
end
