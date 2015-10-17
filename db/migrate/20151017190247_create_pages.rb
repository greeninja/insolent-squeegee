class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer "subject_id"
      # same as: t.references :subject
      t.string "name"
      t.integer "permalink"
      t.integer "position"
      t.boolean "visable", :default => false
      t.timestamps null: false
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end
end
