class AttachmentsController < ApplicationController

  def new
    @attachment = current_user.attachments.build
  end

  def create
    @attachment = current_user.attachments.build(attachment_params)
    if @attachment.save
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
