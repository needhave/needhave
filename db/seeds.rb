# Definition of database seeds

module Seeds
  CreateCategory = Struct.new(:slug, :name, :friendly, :children)

  def self.category(*args)
    CreateCategory.new(*args)
  end

  def self.intialize_categories
    [
      category("help", "Help", nil, [
        category("help.in-person", "In-Person", "In-Person Help"),
        category("help.emergency", "Emergency", "Emergency Help"),
        category("help.other", "Other", "Other Help"),
      ]),
      category("professional", "Professional Work", nil, [
        category("professional.medical", "Medical Care"),
        category("professional.programming", "Programming"),
        category("professional.other", "Other", "Other Professional Work"),
      ]),
      category("supplies", "Supplies", nil, [
        category("supplies.food", "Food", "Food Supplies"),
        category("supplies.cleaning", "Cleaning", "Cleaning Supplies"),
        category("supplies.medical", "Medical", "Medical Supplies"),
        category("supplies.other", "Other", "Other Supplies"),
      ]),
    ].each do |root|
      parent = Category.find_or_create_by!({ name: root.name, slug: root.slug })
      root.children.each do |child|
        Category.create_with({ display_name: child.friendly })
                .find_or_create_by!({ name: child.name, slug: child.slug, parent: parent })
      end
    end
  end
end

# Per-environment seeds
case Rails.env
when "development"
  require_relative 'development/generate'

  Seeds.intialize_categories
  Generate.generate_posts

when "production"
  Seeds.intialize_categories
end
