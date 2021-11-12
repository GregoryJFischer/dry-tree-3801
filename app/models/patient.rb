class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def doctor_patient(doctor)
    DoctorPatient.find_by(patient_id: self.id, doctor_id: doctor.id)
  end
end