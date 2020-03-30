module Generate
  CreatePost = Struct.new(:category, :what)

  def self.post(slug, what)
    CreatePost.new(Category.find_by(slug: slug), what)
  end

  def self.generate_posts
    needed = [
      post("help.other", "help shopping"),
      post("help.in-person", "a babysitter for the kids"),
      post("help.in-person", "volunteer time"),
      post("professional.medical", "nursing skills"),
      post("professional.programming", "development work"),
      post("supplies.cleaning", "toilet paper"),
      post("supplies.food", "flour for cooking"),
      post("supplies.food", "eggs for cooking"),
      post("supplies.food", "baby food"),
    ]
    places = [
      "Boulder, CO",
      "Denver, CO",
      "Grand Junction, CO",
      "New York, NY",
      "Los Angeles, CA"
    ]
    20.times do
      need = needed.sample
      NeedPost.create!({
        category: need.category,
        description: "I need #{need.what}.",
        instructions: "Give me help or supplies at #{places.sample}"
      })
    end
    20.times do
      need = needed.sample
      HavePost.create!({
        category: need.category,
        description: "I have #{need.what}.",
        instructions: "Contact me at #{places.sample}"
      })
    end
  end
end
