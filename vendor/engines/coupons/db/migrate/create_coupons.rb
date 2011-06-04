class CreateCoupons < ActiveRecord::Migration

  def self.up
    create_table :coupons do |t|
      t.string :title
      t.integer :photo_id
      t.string :description
      t.fixnum :discount
      t.integer :position

      t.timestamps
    end

    add_index :coupons, :id

    load(Rails.root.join('db', 'seeds', 'coupons.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "coupons"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/coupons"})
    end

    drop_table :coupons
  end

end
