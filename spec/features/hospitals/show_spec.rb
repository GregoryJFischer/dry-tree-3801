require 'rails_helper'

RSpec.describe 'hospital show page' do
  before :each do
    @hospital = Hospital.create!(name: 'Generic Hospital')

    @doctor1 = @hospital.doctors.create!(name: 'rando', specialty: 'pinky toes', university: 'high school')
    @doctor2 = @hospital.doctors.create!(name: 'ranbo', specialty: 'pinkies', university: 'middle school')
    @doctor3 = @hospital.doctors.create!(name: 'randu', specialty: 'toes', university: 'middle school')
  end

  it 'should have the hospital info' do
    visit hospital_path(@hospital)

    expect(page).to have_content(@hospital.name)
  end

  it 'should list the number of doctors' do
    visit hospital_path(@hospital)

    expect(page).to have_content(("Number of Doctors: 3"))
  end

  it 'should have the universities listed' do
    visit hospital_path(@hospital)

    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@doctor2.university)
  end
end