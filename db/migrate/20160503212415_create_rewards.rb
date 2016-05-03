class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description
      t.integer :threshold
      t.belongs_to :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
