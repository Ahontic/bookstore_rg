# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_customers_on_confirmation_token    (confirmation_token) UNIQUE
#  index_customers_on_email                 (email) UNIQUE
#  index_customers_on_reset_password_token  (reset_password_token) UNIQUE
#

class Customer < ApplicationRecord
  validates :email, presence: true
  validates :email, confirmation: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :secure_validatable,
         :omniauthable, :trackable, :confirmable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.provider = auth.provider
      customer.uid = auth.uid
      customer.password = Devise.friendly_token[0, 20]
    end
  end

  def apply_omniauth(auth)
    update_attributes(
      provider: auth.provider,
      uid: auth.uid
    )
  end

  def facebook_linked?
    provider.present? && uid.present?
  end

  # validate :password_complexity
  # def password_complexity
  #   return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/

  #   errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include:
  #                          1 uppercase, 1 lowercase, 1 digit'
  # end
end
