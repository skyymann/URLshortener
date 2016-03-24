class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, :presence => true
  validates :short_url, :presence => true, :uniqueness => true

  belongs_to(
    :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: :User
  )

  has_many(
    :visits,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Visit
  )
  has_many(
    :visitors,
    through: :visits,
    source: :visitor
  )

  def self.random_code
    code = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom.urlsafe_base64
    end

    code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(long_url: long_url, short_url: ShortenedUrl.random_code, submitter_id: user.id)
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.distinct.count
  end

  def num_recent_uniques
    ShortenedUrl.where(self.created_at > 10.minutes.ago)
  end

end
