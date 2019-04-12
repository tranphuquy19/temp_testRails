module ApplicationHelper
    include Clearance::Controller
    def optionsForm(ops)
        a = "<input type="hidden" name="session[options]" id="option_form" value=\""+ops+"\">"
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
        end
    end
end
