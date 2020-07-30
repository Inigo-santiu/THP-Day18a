class Speciality < ApplicationRecord
  has_many :join_table_doctor_specialities
  has_many :doctors, through: :join_table_doctor_specialities
end
