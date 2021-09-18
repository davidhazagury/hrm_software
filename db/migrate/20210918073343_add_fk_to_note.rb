class AddFkToNote < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :worker, foreign_key: true
  end
end
