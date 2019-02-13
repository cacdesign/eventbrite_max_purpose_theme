class AttendanceMailer < ApplicationMailer

		default from: 'welcome@eventbrite.fr'
 
  def admin_notification_email(attendance)
    #on récupère l'attendance
    @attendance = attendance 


    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://eventbritemax.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.event.admin.email, subject: 'Un nouveau participant!') 
  end


end
