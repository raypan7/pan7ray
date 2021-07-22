class CreateVocabularyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabulary_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
