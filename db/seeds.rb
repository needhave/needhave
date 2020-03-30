# Definition of database seeds

module Seeds
  Category = Struct.new(:name, :slug, :children)

  def self.category(*args)
    Category.new(*args)
  end

  def self.intialize_categories
    [
      category("Help", "help", [
        category("In-Person", "help.in-person"),
        category("Emergency", "help.emergency"),
        category("Other", "help.other"),
      ]),
      category("Professional Work", "professional", [
        category("Medical Care", "professional.medical"),
        category("Programming", "professional.programming"),
        category("Other", "professional.other"),
      ]),
      category("Supplies", "supplies", [
        category("Food", "supplies.food"),
        category("Cleaning", "supplies.cleaning"),
        category("Medical", "supplies.medical"),
        category("Other", "supplies.other"),
      ]),
    ].each do |root|
      parent = NeedCategory.find_or_create_by!({ name: root.name, slug: root.slug })
      root.children.each do |child|
        NeedCategory.find_or_create_by!({ name: child.name, slug: child.slug, parent: parent })
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
