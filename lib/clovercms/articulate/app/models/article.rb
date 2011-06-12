class Article < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :body, :publish_date
  validates_length_of :body, :minimum => 50

  scope :published, where([ 'published = ?', true ])

  def to_param
    if title.present?
      "#{id}-#{title.parameterize}"
    else
      id.to_s
    end
  end
end
