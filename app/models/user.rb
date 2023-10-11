class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :books,dependent: :destroy
         has_one_attached :profile_image
         validates :name,uniqueness: true,length: { in: 2..20}
         validates :introduction,length: { maximum: 50}

         def get_profile_image(width,height)
           if profile_image.attached?
             profile_image
           else
             'no_image'
           end
         end

end
