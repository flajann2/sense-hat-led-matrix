require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe SenseHat do
  before(:each) do
    @sense = SenseHat.new
  end

  it "created a SenseHat instance" do
    expect(@sense).to_not be_nil
  end
  
  it "flushes pixels to the device"
end
