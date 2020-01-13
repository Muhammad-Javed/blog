class CreatePhotes < ActiveRecord::Migration[6.0]
  def change
    create_table :photes do |t|

      t.timestamps
    end
  end
end
