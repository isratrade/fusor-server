class AddSubscriptionsTable < ActiveRecord::Migration
  def change
    create_table "subscriptions", force: :cascade do |t|
      t.integer  "deployment_id"
      t.string   "contract_number",   limit: 255
      t.string   "product_name",      limit: 255
      t.integer  "quantity_attached"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "start_date"
      t.datetime "end_date"
      t.integer  "total_quantity"
      t.string   "source",            limit: 255, default: "imported", null: false
      t.integer  "quantity_to_add",               default: 0
    end
  end
end
