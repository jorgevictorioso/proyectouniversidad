ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "interoperatibilidad.mio@gmail.com",
  :password             => "10406266",
  :authentication       => "plain",
  :enable_starttls_auto => true
}