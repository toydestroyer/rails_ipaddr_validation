validate do
  Rails.logger.info(subnet)
  if Subnet.where("subnet >>= ?", subnet.to_s).any?
    errors.add(:included, "already included")
  end
end
