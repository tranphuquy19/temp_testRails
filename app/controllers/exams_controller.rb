class ExamsController < ApplicationController
    include Clearance::Controller
    include ApplicationHelper
    before_action :ifNotAdmin

    def show
    end

    def create   
    end
    
    def update
        pars = params[:exam]
        list_questions = pars[:list_questions].split("\r\n").map{|tag| tag.strip}.join(",")
        p list_questions
        Exam.find(pars[:id].to_i).update_attributes(title: pars[:title], category_id: Category.find_by(title: pars[:category]))
    end
    

    def edit
        @exam = Exam.find(params[:id])
    end

    def ifNotAdmin
        if checkAuth == false
            redirect_to home_path
        end
    end
end
