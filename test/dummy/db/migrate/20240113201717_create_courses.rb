class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title, null: false, default: ""
      t.datetime :published_at

      t.timestamps
    end
  end
end
