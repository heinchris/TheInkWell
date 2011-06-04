require 'spec_helper'

describe Coupon do

  def reset_coupon(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @coupon.destroy! if @coupon
    @coupon = Coupon.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_coupon
  end

  context "validations" do
    
    it "rejects empty title" do
      Coupon.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_coupon
      Coupon.new(@valid_attributes).should_not be_valid
    end
    
  end

end