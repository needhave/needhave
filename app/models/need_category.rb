class NeedCategory < ApplicationRecord
  belongs_to :parent, class_name: "NeedCategory", optional: true
  has_many :children, class_name: "NeedCategory", foreign_key: "parent_id"

  # Relationships
  has_many :need_posts, foreign_key: 'category_id'
  has_many :have_posts, foreign_key: 'category_id'

  # Validations
  validates :slug, uniqueness: true

  # Callbacks
  def before_create
    if @slug.nil?
      @slug = self.parent_slug ? "#{self.parent_slug}.#{@name.dasherize}" : @name.dasherize
    end
  end

end
