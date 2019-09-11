class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails"}
  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
  def full_name
    first = first_name
    last = last_name
    fullname = "#{first} #{last}"
  end
  belongs_to :user
end