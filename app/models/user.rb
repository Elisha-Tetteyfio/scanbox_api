class User < ApplicationRecord
  has_secure_password
  enum :user_type, superadmin: "SUPERADMIN", merchant: "MERCHANT"
end
