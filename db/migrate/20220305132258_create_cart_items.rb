class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table(:cart_items) do |t|
      t.integer(:cart_id, index: true)
      t.integer(:product_id)
      t.integer(:quantity)
      t.timestamps
    end
  end
end
