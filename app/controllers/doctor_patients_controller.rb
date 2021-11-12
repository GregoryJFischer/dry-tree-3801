class DoctorPatientsController < ApplicationController
  def destroy
    DoctorPatient.destroy(params[:id])

    redirect_to doctor_path(Doctor.find(params[:doctor_id]))
  end
end