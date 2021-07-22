class CreateVocabularyGroupRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :vocabulary_group_relations do |t|
      t.integer :vocabulary_group_id
      t.integer :vocabulary_id

      t.timestamps
    end
  end
end
