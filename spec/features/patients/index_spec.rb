require 'rails_helper'

RSpec.describe 'patients index page' do
  before(:each) do
    @hospital = Hospital.create!(name: 'Generic Hospital')

    @doctor = @hospital.doctors.create!(name: 'rando', specialty: 'pinky toes', university: 'middle school')

    @patient1 = @doctor.patients.create!(name: 'child a', age: 2)
    @patient2 = @doctor.patients.create!(name: 'a litteral rat', age: 1)
    @patient3 = @doctor.patients.create!(name: 'old guy', age: 3)
  end

  it 'lists all patients names in order of age' do
    visit patients_path

    expect(@patient3.name).to appear_before(@patient1.name)
    expect(@patient1.name).to appear_before(@patient2.name)
  end
end