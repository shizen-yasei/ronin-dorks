require 'spec_helper'
require 'ronin/dorks/dork'

describe Dorks::Dork do
  context "default" do
    before(:all) do
      @dork = ronin_dork { }
    end

    it "should have a pause value greater than 0" do
      Dorks::Dork.pause.should > 0
    end

    describe "dork" do
      it "should be exposed for debugging purposes" do
        @dork.should respond_to(:dork)
      end

      it "should return an empty Array" do
        @dork.dork_query.should == []
      end
    end

    it "should have no results" do
      @dork.should be_empty
    end
  end

  describe "pause" do
    before(:all) do
      @dork = ronin_dork do
        dork do
          [
            [
              'http://www.example.com/',
              'http://www.ruby-lang.org/'
            ],
            [
              'http://www.rubyflow.com/',
              'http://www.reddit.com/r/ruby'
            ]
          ]
        end
      end

      @dork.pause = 2.0
    end

    it "should pause between pages" do
      t1 = Time.now
      @dork.each { |result| }
      t2 = Time.now

      (t2 - t1).should >= @dork.pause
    end
  end
end
