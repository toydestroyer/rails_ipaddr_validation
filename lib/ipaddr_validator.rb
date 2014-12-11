class IpaddrValidator < ActiveModel::EachValidator
  def self.valid?
    Subnet.where("subnet >>= ?", "#{subnet}/#{subnet.instance_variable_get(:@mask_addr).to_s(2).count('1')}").any?
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value, self.options)
      record.errors.add(attribute, options[:message] || :included)
    end
  end
end
