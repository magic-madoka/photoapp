class Tag < ActiveRecord::Base
  has_many  :attachments_tags
  has_many  :attachments, through: :attachments_tags

  before_save :titleize_tag

  private

  def titleize_tag
    self.tag_name = self.tag_name.titleize
  end
end
