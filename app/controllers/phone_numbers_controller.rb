class PhoneNumbersController < ApplicationController

  before_filter :lookup_phone_number, only: [:edit, :update, :destroy]
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers
  # POST /phone_numbers.json
  def create
    @phone_number = PhoneNumber.new(phone_number_params)
    #@phone_number.number = @phone_number.number.gsub(/\D/,'')
    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully created.' }
        format.json { render action: 'show', status: :created, location: @phone_number }
      else
        format.html { render action: 'new' }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1
  # PATCH/PUT /phone_numbers/1.json
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1
  # DELETE /phone_numbers/1.json
  def destroy
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to @phone_number.contact }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def phone_number_params
    params.require(:phone_number).permit(:number, :contact_id, :contact_type)
  end

  def lookup_phone_number
    @phone_number = PhoneNumber.find(params[:id])
  end

end
