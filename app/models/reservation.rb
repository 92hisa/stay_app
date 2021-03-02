class Reservation < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :post, optional: true
    
    validate :wong_checkout_cannot_be_reservated
    
    def wong_checkout_cannot_be_reservated
        if checkin > checkout
            errors.add(:checkout, "正しい日付を入力してください")
        end
    end
end
