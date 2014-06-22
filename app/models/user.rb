# encoding: utf-8
class User < ActiveRecord::Base
  
  TYPES = %w(client agent)
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:paypal]
  
  
  has_many :offered_jobs,   class_name: "Job",  foreign_key: :client_id
  has_many :job_offers,     class_name: "Job",  foreign_key: :agent_id
  
  has_one_address
  
  
  def self.find_for_paypal_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.paypal_data"] && session["devise.paypal_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
