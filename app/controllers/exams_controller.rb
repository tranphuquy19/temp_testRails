class ExamsController < ApplicationController
    def show
        @title = "Exam"
        @exam_id = params[:id]
         
    end
    
end
