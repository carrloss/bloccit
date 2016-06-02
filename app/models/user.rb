class User < ActiveRecord::Base

  before_save { self.email = email.downcase if email.present? }
  # before_save { self.name = name.split(" ").map {|i| i.capitalize}.join(" ") if name.present? }
  before_save :capitalize_name

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, unless: :password_digest
  validates :password, length: {minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false },
            length: { minimum: 3, maximum:254 }



  has_secure_password

  private

  def capitalize_name
    return unless name

    a = []
    name.split(' ').each do |v|
      a << v.capitalize
    end
    self.name = a.join(" ")
  end
end
