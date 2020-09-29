class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.bigint :post_id

      t.timestamps
    end
  end
end
