# frozen_string_literal: true

# app/models/product.rb
class Product < ApplicationRecord
  validates :name, presence: true
  validates :ean, uniqueness: true, allow_nil: true

  belongs_to :item
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients

  mount_uploader :photo, PhotoUploader

  def parse(*attributes)
    ParseService.new(self, attributes)
  end

  def update_photo
    self.remote_photo_url = ig_pic_url
    save
  rescue Cloudinary::CarrierWave::UploadError => exs
    p exs.to_s
    follower.visit
    follower.promote!
    reload
    retry
  rescue CloudinaryException => exs
    p exs.to_s
    p 'Waiting 2 seconds to retry'
    sleep 2
    retry
  end

  (attribute_names + %w[ingredients]).each do |attribute|
    define_method :"parse_#{attribute}" do
      ParseService.new(self, [attribute.to_sym])
    end
  end
end
