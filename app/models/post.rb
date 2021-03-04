class Post < ApplicationRecord
    
    belongs_to :user, optional: true
    has_many :reservations, dependent: :destroy
    
    mount_uploader :caption, ImageUploader
    
    validates :room_name, presence: true
    validates :city, presence: true
    validates :price, presence: true
    
    def self.search(search)
      if search
        Post.where(['city LIKE ?', "%#{search}%"])
      else
        Post.all
      end
    end
    
end
