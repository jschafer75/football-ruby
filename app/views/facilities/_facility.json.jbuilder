# frozen_string_literal: true

json.extract! facility, :id, :created_at, :updated_at
json.url facility_url(facility, format: :json)
