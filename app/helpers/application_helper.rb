module ApplicationHelper
    include Clearance::Controller
    def timePickerToDateTime(time)
        DateTime.strptime(time, "%m/%d/%Y %I:%M %p")
    end

    def dateTimeToTimePicker(datetime)
        datetime.strftime("%m/%d/%Y %I:%M %p")
    end

    def optionsForm(form, ops)
        a = ("<input type=\"hidden\" name=\"#{form}[options]\" id=\"options_form\" value=\"#{ops}\">").html_safe
    end

    def csrf
        hidden_field_tag :authenticity_token, form_authenticity_token
    end
    
    def nameNotNil
        if signed_in?
            if current_user.name.blank?
                return false
            else
                return true
            end
        else
            return false
        end
    end

    def isAdmin
        if signed_in? == false
            return false
        else
            current_user.role == 2 ? true : false
        end
    end
    
    def checkAuth
        if signed_in?
            isAdmin ? true : false
        else 
            redirect_to sign_in_path
            return false
        end
    end
end
