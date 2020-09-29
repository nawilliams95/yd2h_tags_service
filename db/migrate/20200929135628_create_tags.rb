class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.bigint :post_id, array: true, default: []

      t.timestamps
    end
  end
end
