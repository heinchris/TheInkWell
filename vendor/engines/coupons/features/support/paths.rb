module NavigationHelpers
  module Refinery
    module Coupons
      def path_to(page_name)
        case page_name
        when /the list of coupons/
          admin_coupons_path

         when /the new coupon form/
          new_admin_coupon_path
        else
          nil
        end
      end
    end
  end
end
