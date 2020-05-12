class Book < ApplicationRecord

	belongs_to :user
	# bookインスタンス.user


    validates :title, presence: true
    validates :body, presence: true, length: {maximum: 200}

end
