class IpaddrValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless record.class.where("subnet >>= ?", "#{record}/#{record.instance_variable_get(:@mask_addr).to_s(2).count('1')}").any?
      record.errors.add(attribute, options[:message] || :included)
    end
  end
end
