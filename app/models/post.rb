class Post < ApplicationRecord
    
    belongs_to :user, optional: true
    has_many :reservations, dependent: :destroy
    
    mount_uploader :caption, ImageUploader
    
end
