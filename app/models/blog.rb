class Blog < ActiveRecord::Base
  has_many :comments

  validates_presence_of :header, :text
end
