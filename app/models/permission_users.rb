class PermissionUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :permission
end