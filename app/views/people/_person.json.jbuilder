json.extract! person, :id, :first_name, :last_name, :father_name, :phone_number, :email, :birth_data_time, :note_data, :other_data, :position, :sex, :created_at, :updated_at
json.url person_url(person, format: :json)
