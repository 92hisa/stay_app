class Reservation < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true
    
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :people, presence: true
    
    validate :wrong_checkout_cannot_be_reservated
    
    def wrong_checkout_cannot_be_reservated
        if checkout < checkin
            errors.add(:checkout, "正しい日付を入力してください")
        end
    end
end
