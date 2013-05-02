# This migration comes from spree_gocardless (originally 20130430141808)
class CreateGocardlessPayments < ActiveRecord::Migration
  def change
    create_table :spree_gocardless_payments do |t|
      t.string :number
      t.string :resource_id
      t.string :resource_type
      t.string :status
      t.date :paid

      t.timestamps
    end
  end
end
