class Contact < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end
  def full_name
    first = first_name
    last = last_name
    fullname = "#{first} #{last}"
  end
end