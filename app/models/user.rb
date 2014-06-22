# encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#  user_type              :string(255)
#

class User < ActiveRecord::Base

  TYPES = %w(client agent)

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:paypal]
  
  attr_accessor :image_url
  
  has_many :offered_jobs,   class_name: "Job",  foreign_key: :client_id
  has_many :job_offers,     class_name: "Job",  foreign_key: :agent_id
  has_one_address
  
  dragonfly_accessor :image
  
  before_validation :check_for_changes
  
  
  scope :random, ->(*args) { where(nil).order('RAND()').limit(args.first || 1) }
  scope :agents, -> { where( user_type: "agent" ) }
  
  
  def has_initials?
    self.image_name.to_s == "initials.png"
  end

  def has_image?
    self.image_stored?
  end

  def get_image_url
    self.image_stored? ? self.image.thumb("150x150#").url() : "fallbacks/user3_360.png"
  end

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
  
  
  private
    
    def check_for_changes
      self.first_name = self.first_name.to_s.strip.capitalize if self.first_name_changed?
      self.last_name = self.last_name.to_s.strip.capitalize if self.last_name_changed?
      self.name = "#{first_name} #{last_name}".strip if self.first_name_changed? || self.last_name_changed?
      generate_initials if self.image_url.blank?
      generate_image if self.image_url.present?
    end

    def generate_image
      app = Dragonfly.app
      self.image = app.fetch_url( self.image_url.to_s )
    end

    def generate_initials
      # generate new initials if needed
      if (self.first_name.present? && self.last_name.present?) && (!self.image_stored? || ((self.first_name_changed? || self.last_name_changed?) && self.has_initials?))
        app = Dragonfly.app
        self.image = app.generate(:square_text, "#{self.first_name.to_s[0]}#{self.last_name.to_s[0]}".strip)
      end
    end
    
end
