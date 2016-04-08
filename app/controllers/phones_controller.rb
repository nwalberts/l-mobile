class PhonesController < ApplicationController

  def index
    @phones = Phone.all
    @phone = Phone.new
    @os_collection = []
    OperatingSystem.all.each do |os|
      @os_collection << os.name
    end
  end

  def create
    phone = Phone.new(phone_params)
    os = OperatingSystem.find_by(name: params[:phone][:operating_system])
    phone.operating_system = os
    if phone.save
      flash[:notification] = "Phone Added!"
    else
      flash[:error] = "Phone Added...NOT!!!"
    end
    redirect_to phones_path
  end

  private

  def phone_params
    params.require(:phone).permit(
    :manufacturer,
    :size,
    :operating_system_id,
    :model,
    :charging_port,
    :quantity)
  end

end
