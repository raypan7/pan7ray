class CreateVocabularies < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabularies do |t|
      t.string :english
      t.string :chinese
      t.integer :error_times
      t.timestamps
    end
    add_index :vocabularies, :english, unique: true
  end
end
