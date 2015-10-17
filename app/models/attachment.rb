class Attachment < ActiveRecord::Base
  belongs_to :user
  has_many  :attachment_tags
  has_many  :tags, through: :attachment_tags

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  scope :latest, -> { order('created_at DESC') }
  scope :tagged, -> (tag) { joins(:tags).where(tags: { tag_name: tag }) }

  mount_uploader :photo, PhotoUploader

  def add_tags(tags)
    tags = tags.map do |key, tag|
      self.tags << Tag.find_or_create_by(tag_name: tag['tag_name'].titleize)
    end
  end
end
