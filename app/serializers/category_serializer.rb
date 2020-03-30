# KEEP UPDATED WITH:
#
#   frontend/app/models/category.js
#
class CategorySerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :unaltered

  attributes :id, :name, :slug, :description
  belongs_to :parent, record_type: :category
  has_many :children, record_type: :category, if: Proc.new { |category| category.parent_id.nil? }
end
