class VoxMailsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def attachments
    if params[:csv_file].present?
      registers = CsvImporter.execute(params[:csv_file].tempfile)
      # send_multiple_emails(registers)
    else
      redirect_to root_path, notice: "Emails sendo enviados."
    end
  end

  def send_multiple_emails(arr)
    arr.each do |i|
      VoxMailer.with(register: i.to_json).send_email.deliver_later
    end
  end
end