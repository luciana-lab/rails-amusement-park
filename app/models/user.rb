class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    validates :password, presence: true
    
    # has a method 'mood' that returns 'sad' when the user is more nauseous than happy
    # has a method 'mood' that returns 'happy' when the user is more happy than nauseous
    def mood
        unless admin
            if self.nausea < self.happiness
                mood = "happy"
            else
                mood = "sad"
            end
        end
    end

    # ADMIN = {
    #     true: 1,
    #     false: 0
    # }

    # def admin?
    #     self.admin == ADMIN[1]
    # end

    # def non_admin?
    #     self.admin == ADMIN[0]
    # end
end
