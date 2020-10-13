class VoxMailer < ApplicationMailer
  def send_email
    json = params[:register].is_a?(Hash) ? params[:register] : JSON.parse(params[:register])
    @register = OpenStruct.new(json)
    file_path = "/home/diego/Downloads/Comprovante.pdf"
    encoded_content = File.read(file_path)
    attachments['PDF - Teste'] = {
      mime_type: 'application/pdf',
      content: encoded_content
    }
    byebug
    mail(
      # to: "#{@register[:email]}",
      to: "diego.oliveira@pitzi.com.br",
      subject: "Gravação Vox - #{@register.voice_actor} - Estúdio #{@register.studio} - #{@register.date}",
    )
  end
end
