class JobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @job = Job.create(url: params[:url], employer_name: params[:employer_name], 
        employer_description: params[:employer_description], job_title: params[:job_title],
        job_description: params[:job_description], year_of_experience: params[:year_of_experience], 
        education_requirement: params[:education_requirement], industry: params[:industry],
        base_salary: params[:base_salary], employment_type_id: params[:employment_type_id])        
        render 'jobs/create.jbuilder'
        
    end

    def index
        @jobs = Job.all
        render 'jobs/index.jbuilder'
    end
    #def index
    #    list_job = Job.all
    #    render json: { post: list_job }
    #end

    def show
        jobsid = Job.find_by(id: params[:id])
        #render 'jobs/show.jbuilder'
        render json: { jobid: jobsid } 
    end

  private
    def job_params
        params.require(:job).permit(:employer_name)  
    end
end