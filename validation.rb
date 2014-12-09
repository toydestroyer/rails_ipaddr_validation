validate do
  Rails.logger.info(subnet)
  if Subnet.where("subnet >>= ?", "#{subnet}/#{subnet.instance_variable_get(:@mask_addr).to_s(2).count('1')}").any?
    errors.add(:included, "Данная подсеть уже покрыта")
  end
end
