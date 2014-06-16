module Uploadable
  extend ActiveSupport::Concern
  included do
    #validates :pictureurl, presence: true
    validate :check_location
    before_destroy :delete_file
  end 
  
  def delete_file
    if !self.pictureurl.nil?
      File.delete(self.pictureurl)
    end
  end
  
  def check_location
    if self.pictureurl.nil? && File.exists?('app/assets/imagaes/' + self.pictureurl.to_s) #if nil and if it already exists, then it is invalid
      errors.add(:pictureurl, "is invalid" + self.pictureurl.to_s)
    end
  end 
  
  def upload=(uploaded_file)
    if uploaded_file.nil?
      errors.add(:pictureurl, "There was no uploaded file!")
    else
      time_no_spaces = Time.now.to_s.gsub(/\s/, '_')
      filename = time_no_spaces.to_s + SecureRandom.hex + '.jpg'
      pictureurl = Rails.root.join('app','assets','images', filename).to_s
      
      #puts("Saving to #{pictureurl}")

      IO::copy_stream(uploaded_file.path, pictureurl)
    end
    self.pictureurl = filename
  end
end 