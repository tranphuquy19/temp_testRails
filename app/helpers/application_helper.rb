require 'redcarpet'
include Clearance::Controller
module ApplicationHelper
    #Convert markdown to HTML
    def markdown(text)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
            no_intra_emphasis: true,
            fenced_code_blocks: true,
            disable_indented_code_blocks: true,
            autolink: true,
            tables: true,
            underline: true,
            highlight: true
           )
    return markdown.render(text).html_safe
    
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
        end

    end
end
