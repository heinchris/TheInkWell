class CouponsController < ApplicationController

  before_filter :find_all_coupons
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @coupon in the line below:
    present(@page)
  end

  def show
    @coupon = Coupon.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @coupon in the line below:
    present(@page)
  end

protected

  def find_all_coupons
    @coupons = Coupon.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/coupons").first
  end

end
