require 'spec_helper'
require 'ronin/dorks/dork'

describe Dorks::Dork do
  it "should have a pause value greater than 0" do
    Dorks::Dork.pause.should > 0
  end

  context "default" do
    subject { ronin_dork() { } }

    it "should return an empty Array when calling dork_query" do
      subject.dork_query.should == []
    end

    it "should have no results" do
      should be_empty
    end
  end

  context "custom" do
    subject do
      ronin_dork do
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
    end

    it "should enumerate over the results, in each page, in the query" do
      subject.each.to_a.should == [
        URI('http://www.example.com/'),
        URI('http://www.ruby-lang.org/'),
        URI('http://www.rubyflow.com/'),
        URI('http://www.reddit.com/r/ruby')
      ]
    end

    it "should pause between pages" do
      t1 = Time.now
      subject.each { |result| }
      t2 = Time.now

      (t2 - t1).should >= subject.pause
    end
  end
end
