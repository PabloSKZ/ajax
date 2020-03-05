class EmailController < ApplicationController
  def index
    @email = Email.all
  end

  def new
  end

  def create
    @email = Email.create(object: Faker::Lorem.word, body: Faker::Lorem.paragraphs)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(email_params)
    redirect_to email_path
    flash[:notice] = "Email édité !"
  end

  def destroy
    @email = Email.find(params[:id])
    @email_array = Email.all
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
