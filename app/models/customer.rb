# frozen_string_literal: true

require 'open-uri'
class Customer < ApplicationRecord
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :books, through: :carts

  validates :email, presence: true
  validates :email, confirmation: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :secure_validatable,
         :omniauthable, :trackable, :confirmable, omniauth_providers: [:facebook]

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.provider = auth.provider
      customer.uid = auth.uid
      customer.password = Devise.friendly_token[0, 20]
      customer.avatar = auth.info.image
      customer.skip_confirmation!
    end
  end

  def apply_omniauth(auth)
    update(
      provider: auth.provider,
      uid: auth.uid
    )
  end

  def facebook_linked?
    provider.present? && uid.present?
  end
end
