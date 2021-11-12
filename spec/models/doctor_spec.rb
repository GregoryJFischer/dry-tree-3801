require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it {should have_many :doctor_patients}
    it {should have_many(:patients).through(:doctor_patients)}
  end

  describe 'class methods' do
    before(:each) do
      @hospital = Hospital.create!(name: 'Generic Hospital')

      @doctor1 = @hospital.doctors.create!(name: 'rando', specialty: 'pinky toes', university: 'high school')
      @doctor2 = @hospital.doctors.create!(name: 'ranbo', specialty: 'pinkies', university: 'middle school')
      @doctor3 = @hospital.doctors.create!(name: 'randu', specialty: 'toes', university: 'middle school')
    end

    describe '.universities' do
      it 'lists the universities of all of the doctors' do
        expect(Doctor.universities.length).to eq 2
        expect(Doctor.universities[1].university).to eq(@doctor1.university)
        expect(Doctor.universities[0].university).to eq(@doctor2.university)
      end
    end
  end
end
