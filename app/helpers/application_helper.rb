module ApplicationHelper
    #function for show message custom
        def mensajes()
        if !"#{notice}".blank?
            if "#{notice}"[0] == "#"
                return "<div data-alert class='alert-box', style='font-size:18px;'>
                        #{notice.delete('#')}
  <a href='#' class='close'>&times;</a>
</div>".html_safe
            else
                return "<div data-alert class='alert-box alert', style='font-size:18px;'>
                            #{notice} 
  <a href='#' class='close'>&times;</a>
</div>".html_safe
            end
        end
    end

    def get_name(x)
        "#{User.find(Profesore.find(x).user_id).nombre} #{User.find(Profesore.find(x).user_id).apellido}"
    end

    def get_name_profesor_id(x)
        User.find(Profesore.find(x).user_id).dni
    end

    def verstatus(x)
        case x
        when 1
            return "Diseño"
        when 2
            "Ejecuciòn"
        when 3
            ".."
        else
            "sin proyecto"
        end
    end

    def vercomunal(x)
        Comunal.find(x).nombrec

    end

    def get_insti(x)
        Institucione.find(x).nombre
    end




end
