class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,     null:false
      t.text       :description,      null:false
      t.integer    :category_id,      null:false
      t.integer    :status_id,        null:false
      t.integer    :burden_id,        null:false
      t.integer    :prefecture_id,    null:false
      t.integer    :delivery_date_id, null:false
      t.string     :price,            null:false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
