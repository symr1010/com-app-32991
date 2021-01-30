class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  with_options presence: true do 
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :password, format: { with: PASSWORD_REGEX, message: 'はアルファベットと数字を含めてください' }, length: { minimum: 6 }, on: :create
    validates :nickname
    validates :profession
  end  

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :age_id
    validates :sex_id
  end

  
  belongs_to :age
  belongs_to :sex
end
