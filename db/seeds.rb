User.find_or_create_by!(email: "temp.user@gmail.com") do |user|
  user.first_name = "Temp"
  user.last_name = "User"
  user.password = "password" 
  user.phone_number = "0123456789"
  user.user_type= "superadmin"
end