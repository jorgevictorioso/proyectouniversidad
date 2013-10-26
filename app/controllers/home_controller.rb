class HomeController < ApplicationController
	include AuthenticationsHelper



  def index
  	trueredirectpowersession(1,home_comunal_path)
    trueredirectpowersession(2,home_alumno_path)
  	trueredirectpowersession(3,home_profesor_path)
  end

  def comunal
  	falseredirectpowersession(1,home_path)
  end

  def profesor
  	falseredirectpowersession(3,home_path)
  end

  def alumno
  end



end
