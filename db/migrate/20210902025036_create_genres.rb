class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :type_of_genre

      t.timestamps
    end
  end
end
