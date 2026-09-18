require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user should have first and last name" do
    user = User.new(email_address: "admin@gmail.com", role: "admin", password: "12345", password_confirmation: "12345")

    assert_not user.valid?
  end

  test "user should have email" do
    user = User.new(first_name: "julian", last_name: "kibet", role: "admin", password: "12345", password_confirmation: "12345")

    assert_not user.valid?
  end

  test "user if admin" do
    usera = User.new(first_name: "julian", last_name: "kibet", email_address: "admin@gmail.com", role: "admin", tenant_id: nil, password: "12345", password_confirmation: "12345")
    assert usera.valid?
  end
  test "user if salon_admin" do
    userb = User.new(first_name: "Grace", last_name: "ann", email_address: "salonadmin@gmail.com", role: "salon_admin", password: "12345", password_confirmation: "12345")
    assert_not userb.valid?
  end
end
