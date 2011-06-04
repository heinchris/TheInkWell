module Admin
  class CouponsController < Admin::BaseController

    crudify :coupon, :xhr_paging => true

  end
end
