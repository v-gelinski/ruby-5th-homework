class Validations

EMAIL_REGEX = /\w[\w_\+\.]{0,200}@(\w[\w-]{0,61}\w)(\.\g<1>)*[a-zA-Z]{2,3}(\.[a-zA-Z]{2})?/
PHONE_REGEX = /(0)|((00)(\+[1-9]\d{0,2}))([ \(\)-]{0,2}\d){6,11}/
HOSTNAME_REGEX = /(\w[\w-]{0,61}\w)(\.\g<1>)*[a-zA-Z]{2,3}(\.[a-zA-Z]{2})?/
NUMBER_REGEX = /\-?\d+(\.\d)?\d*/
INTEGER_REGEX = /\-?\d+/
DATE_REGEX = /\d{4}\-\d{2}-\d{2}/
TIME_REGEX = /\d{2}:\d{2}:\d{2}/
DATE_TIME_REGEX = /\d{4}\-\d{2}-\d{2}[ T]d{2}:\d{2}:\d{2}/

  def Validations.email?(value)
    EMAIL_REGEX.match(value) != nil
  end

  def Validations.hostname?(value)
    HOSTNAME_REGEX.match(value) != nil
  end

  def Validations.phone?(value)
    PHONE_REGEX.match(value) != nil
  end

  def Validations.number?(value)
    NUMBER_REGEX.match(value) != nil
  end

  def Validations.integer?(value)
    INTEGER_REGEX.match(value) != nil
  end

  def Validations.date?(value)
    DATE_REGEX.match(value) != nil
  end

  def Validations.time?(value)
    TIME_REGEX.match(value) != nil
  end

  def Validations.date_time?(value)
    DATE_TIME_REGEX.match(value) != nil
  end

end
