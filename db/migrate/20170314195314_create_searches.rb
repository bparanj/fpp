class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :term
      t.text :results

      t.timestamps
    end
  end
end
