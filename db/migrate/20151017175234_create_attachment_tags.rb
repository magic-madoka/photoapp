class CreateAttachmentTags < ActiveRecord::Migration
  def change
    create_table :attachment_tags do |t|
      t.references :attachment, index: true, foreign_key: true
      t.references :tag,        index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
