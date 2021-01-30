class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字混合文字を使用してください', on: :create
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
