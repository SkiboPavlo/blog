class CompressedUrl < ActiveRecord::Base

  def compress!
    self.name = SecureRandom.hex
    self.save
  end
end
