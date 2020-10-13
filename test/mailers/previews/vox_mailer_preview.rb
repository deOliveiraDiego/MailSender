# Preview all emails at http://localhost:3000/rails/mailers/vox_mailer
class VoxMailerPreview < ActionMailer::Preview
  def send_email
    register = {:voice_actor=>"Claudia Carli", :phone=>"99195-7665", :email=>"claudiacarlidub@gmail.com", :studio=>"F", :time=>"09", :date=>"02.10", formatted_date: Date.today}

    VoxMailer.with(register:  register).send_email
  end
end
