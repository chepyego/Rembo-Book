# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create an administrator account if it doesn't already exist.
# User.find_or_create_by!(email_address: "jchepyego@gmail.com") do |user|
#   # Add the required name field, if your User model validates its presence.
#   user.first_name = "Admin1"
#   user.last_name = "Admin1"

#   user.password = "jemimah21"
#   # IMPORTANT: Password confirmation is required by most Rails authentication setups.
#   user.password_confirmation = "jemimah21"

#   user.role = "admin"
# end
unless User.exists?(role: "admin")
  User.create!(first_name: "Admin", last_name: "Admin", email_address: ENV['ADMIN_EMAIL'], role: "admin", password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD_CONFIRMATION'])
end
