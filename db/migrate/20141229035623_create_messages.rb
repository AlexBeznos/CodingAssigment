class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body, limit: 255

      t.timestamps
    end
  end
end
