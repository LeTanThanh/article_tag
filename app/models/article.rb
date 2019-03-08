class Article < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  attr_accessor :tags_name
  after_save :save_tags

  validates :title, presence: true
  validates :content, presence: true

  def tags_name
    tags.pluck(:name).join(", ")
  end

  private

  def save_tags
    taggings.destroy_all
    @tags_name.split(", ").each do |tag_name|
      next if tag_name.blank?

      tag = Tag.where(name: tag_name).first_or_create
      taggings.where(tag_id: tag.id).first_or_create
    end
  end
end
