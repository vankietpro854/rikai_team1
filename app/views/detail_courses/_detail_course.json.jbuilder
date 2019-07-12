json.extract! detail_course, :id, :user_id, :cour_id, :begin, :end, :created_at, :updated_at
json.url detail_course_url(detail_course, format: :json)
