class Message
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :subject
  attribute :content

  validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :subject, presence: true, length: { maximum: 40 }
	validates :content, length: { maximum: 500 }
end