require 'refinerycms-base'

module Refinery
  module Coupons
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "coupons"
          plugin.activity = {
            :class => Coupon
          }
        end
      end
    end
  end
end
