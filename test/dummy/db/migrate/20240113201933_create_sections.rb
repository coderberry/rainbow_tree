# frozen_string_literal: true

class CreateSections < ActiveRecord::Migration[7.1]
  def change
    create_table :sections do |t|
      t.string :title, null: false, default: ""
      t.references :course, null: false
      t.references :parent
      t.integer :position, null: false, default: 0
      t.datetime :published_at

      t.timestamps
    end
  end
end
