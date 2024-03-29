class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,    null: false, default: ""
      t.text       :concept,         null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :product_price,   null: false
      t.integer    :charge_price_id, null: false
      t.integer    :deadline_id,     null: false
      t.integer    :area_id,         null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
