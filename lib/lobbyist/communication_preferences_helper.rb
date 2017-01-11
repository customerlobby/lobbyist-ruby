module CommunicationPreferencesHelper
  DC_WANTS_EMAIL       = 0b000000000001
  DC_WANTS_CALL        = 0b000000000010
  DC_WANTS_SMS         = 0b000000000100
  DC_WANTS_MAIL        = 0b000000001000
  MEMBER_WANTS_EMAIL   = 0b000000010000
  MEMBER_WANTS_CALL    = 0b000000100000
  MEMBER_WANTS_SMS     = 0b000001000000
  MEMBER_WANTS_MAIL    = 0b000010000000
  CUSTOMER_WANTS_EMAIL = 0b000100000000
  CUSTOMER_WANTS_CALL  = 0b001000000000
  CUSTOMER_WANTS_SMS   = 0b010000000000
  CUSTOMER_WANTS_MAIL  = 0b100000000000

  def wants_email?
    direct_connect_wants_email? && member_wants_email? && customer_wants_email?
  end

  def wants_call?
    direct_connect_wants_call? && member_wants_call? && customer_wants_call?
  end

  def wants_sms?
    direct_connect_wants_sms? && member_wants_sms? && customer_wants_sms?
  end

  def wants_mail?
    direct_connect_wants_mail? && member_wants_mail? && customer_wants_mail?
  end

  def direct_connect_wants_email?
    is_set?(DC_WANTS_EMAIL)
  end

  def direct_connect_wants_call?
    is_set?(DC_WANTS_CALL)
  end

  def direct_connect_wants_sms?
    is_set?(DC_WANTS_SMS)
  end

  def direct_connect_wants_mail?
    is_set?(DC_WANTS_MAIL)
  end

  def member_wants_email?
    is_set?(MEMBER_WANTS_EMAIL)
  end

  def member_wants_call?
    is_set?(MEMBER_WANTS_CALL)
  end

  def member_wants_sms?
    is_set?(MEMBER_WANTS_SMS)
  end

  def member_wants_mail?
    is_set?(MEMBER_WANTS_MAIL)
  end

  def customer_wants_email?
    is_set?(CUSTOMER_WANTS_EMAIL)
  end

  def customer_wants_call?
    is_set?(CUSTOMER_WANTS_CALL)
  end

  def customer_wants_sms?
    is_set?(CUSTOMER_WANTS_SMS)
  end

  def customer_wants_mail?
    is_set?(CUSTOMER_WANTS_MAIL)
  end

  private

  def is_set?(flag)
    communication_preferences & flag != 0
  end
end
