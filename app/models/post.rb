class Post < ApplicationRecord
    
    belongs_to :user, optional: true
    has_many :reservations, dependent: :destroy
    
    mount_uploader :caption, ImageUploader
    
    def self.search(search)
      if search
        Post.where(['prefecture LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end
    
end
