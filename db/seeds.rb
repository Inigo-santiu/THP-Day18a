# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
Speciality.destroy_all

100.times do
  patient_list = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name )
  doctor_list = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end


spec = ["Orthophonist", "Generalist", "Dentist", "Ophtalmologist", "Stomatologist", "Gynecologist"]
  i = 0
  spec.length.times do
  speciality_list = Speciality.create!(name: spec[i])
  i+=1
end

20.times do 
  city_list = City.create!(name: Faker::Address.city, zip_code:Faker::Address.zip_code)
end


#Méthode création random date
def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end


20.times do
  JoinTableDoctorSpeciality.create(doctor: Doctor.find(rand(Doctor.first.id..Doctor.last.id)), speciality: Speciality.find(rand(Speciality.first.id..Speciality.last.id)))
end

50.times do
  appointment_list = Appointment.create!(
    doctor: Doctor.find(rand(Doctor.first.id..Doctor.last.id)),
    patient: Patient.find(rand(Patient.first.id..Patient.last.id)),
    date: time_rand,
    city: City.find(rand(City.first.id..City.last.id))
  )
end

