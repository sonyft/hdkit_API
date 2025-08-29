require 'ostruct'

class Bodygraph < OpenStruct
  # This is a simple model that extends OpenStruct
  # In a real application, you might want to use ActiveRecord or another ORM

  def initialize(attributes = {})
    super(attributes)
  end

  # Add any additional methods or validations here
  def valid?
    name.present? && birth_date.present? && birth_time.present? &&
    birth_country.present? && birth_city.present?
  end

  def present?
    !nil?
  end
end
