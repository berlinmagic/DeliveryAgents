# encoding: binary
class EmailValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    unless value =~ MailReg::EmailAddress
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.email')) 
    end
  end
  
end
