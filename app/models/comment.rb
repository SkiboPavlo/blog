class Comment < ActiveRecord::Base
  belongs_to :blog

  validates_presence_of :text

  def like!
    self.likes ||= 0
    self.likes += 1
    self.save
  end
end
