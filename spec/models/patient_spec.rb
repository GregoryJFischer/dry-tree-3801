require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it {should have_many :doctor_patients}
    it {should have_many(:doctors).through(:doctor_patients)}
  end

  describe 'instance methods' do
    describe '#doctor_patient' do
      it 'returns the doctor patient associated with a given doctor and patient' do
        hospital = Hospital.create!(name: 'Generic Hospital')

        doctor = hospital.doctors.create!(name: 'rando', specialty: 'pinky toes', university: 'middle school')

        patient = Patient.create!(name: 'child a', age: 1)

        doctor_patient = DoctorPatient.create!(patient: patient, doctor: doctor)

        expect(patient.doctor_patient(doctor)).to eq(doctor_patient)
      end
    end
  end
end