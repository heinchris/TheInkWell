Given /^I have no coupons$/ do
  Coupon.delete_all
end

Given /^I (only )?have coupons titled "?([^\"]*)"?$/ do |only, titles|
  Coupon.delete_all if only
  titles.split(', ').each do |title|
    Coupon.create(:title => title)
  end
end

Then /^I should have ([0-9]+) coupons?$/ do |count|
  Coupon.count.should == count.to_i
end
