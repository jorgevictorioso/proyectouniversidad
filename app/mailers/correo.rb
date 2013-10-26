class Correo < ActionMailer::Base
  #default from: "from@example.com"
  def mycorreo(titulo,mensaje,email)
    mail(:to => email, :subject => titulo, :from => email) do |format|
      format.html {render :text => mensaje}
    end
  end
end
