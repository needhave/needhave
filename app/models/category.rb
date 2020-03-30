class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true
  has_many :children, class_name: "Category", foreign_key: "parent_id"

  # Relationships
  has_many :need_posts
  has_many :have_posts

  # Validations
  validates :slug, uniqueness: true

  # Callbacks
  def before_create
    if @slug.nil?
      @slug = self.parent_slug ? "#{self.parent_slug}.#{@name.dasherize}" : @name.dasherize
    end
  end

end
