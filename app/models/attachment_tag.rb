class AttachmentTag < ActiveRecord::Base
  belongs_to :attachment
  belongs_to :tag
end
