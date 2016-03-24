class Visit < ActiveRecord::Base
  validates :visitor_id, presence: true
  validates :url_id, presence: true


  belongs_to(
    :shortened_url,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :ShortenedUrl
  )

  belongs_to(
    :visitor,
    foreign_key: :visitor_id,
    primary_key: :id,
    class_name: :User
  )

  def self.record_visit!(user, shortened_url)
    Visit.create!(visitor_id: user.id, url_id: shortened_url.id)
  end

end
