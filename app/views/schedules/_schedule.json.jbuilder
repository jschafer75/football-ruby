# frozen_string_literal: true

json.extract! schedule, :id, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)