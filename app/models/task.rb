class Task < ApplicationRecord
  include TaskRepository

  has_many :task_services, dependent: :destroy
  has_many :services, through: :task_services
  belongs_to :user
  belongs_to :city
  belongs_to :district
  has_many :comments, dependent: :delete_all
  has_many_attached :images
  has_many_attached :videos
  validates :images, file_size: { less_than: 1.megabytes }
  validates :description, presence: true, length: { minimum: 10 }
  validates :title, presence: true, length: { minimum: 10 }
  validates :address, presence: true, length: { minimum: 10 }
  validate :image_type
  validate :video_type
  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition active: :deleted
    end

    event :restore do
      transition deleted: :active
    end
  end

  def thumbnail(input)
    images[input].variant(resize: '300x300!').processed
  end

  private
  def image_type
    images.each do |image|
      errors.add(:images, 'должно быть JPEG или PNG') unless image.content_type.in?(%('image/jpeg image/png'))
    end
  end

  def video_type
    videos.each do |video|
      errors.add(:videos, 'должно быть MP4 или AVI') unless video.content_type.in?(%('video/mp4 video/avi'))
    end
  end
end
