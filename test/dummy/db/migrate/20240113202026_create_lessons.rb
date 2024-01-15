# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title, null: false, default: ""
      t.references :section, null: false
      t.integer :position, null: false, default: 0
      t.datetime :published_at

      t.timestamps
    end
  end
end
