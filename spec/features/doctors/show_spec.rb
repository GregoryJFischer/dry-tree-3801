require 'rails_helper'

RSpec.describe 'doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: 'Generic Hospital')

    @doctor = @hospital.doctors.create!(name: 'rando', specialty: 'pinky toes', university: 'middle school')

    @patient1 = @doctor.patients.create!(name: 'child a', age: 1)
    @patient2 = @doctor.patients.create!(name: 'a litteral rat', age: 2)
    @patient3 = @doctor.patients.create!(name: 'old guy', age: 3)
  end

  it "has the doctor's information" do
    visit doctor_path(@doctor)

    expect(page).to have_content(@doctor.name)
    expect(page).to have_content(@doctor.specialty)
    expect(page).to have_content(@doctor.university)
  end

  it 'should have the hospital name' do
    visit doctor_path(@doctor)

    expect(page).to have_content(@hospital.name)
  end

  it 'should have the names of the doctors patients' do
    visit doctor_path(@doctor)

    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
  end
end