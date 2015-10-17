class AttachmentsController < ApplicationController

  def new
    @attachment = current_user.attachments.build
    @attachment.tags.build
  end

  def create
    @attachment = current_user.attachments.build(attachment_params)
    if @attachment.save
      @attachment.add_tags(params[:attachment][:tags_attributes])
      redirect_to :root
    else
      render :new
    end
  end


  private

  def attachment_params
    params.require(:attachment).permit(:photo)
  end
end
