class Article < ApplicationRecord
  self.per_page = 6

  has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
  scope :last_published, -> { order(created_at: :desc) }

  # def to_xml
  #
  # end
end
