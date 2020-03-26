module Generate
    def self.generate_needs
        needed = [
            "help shopping",
            "a babysitter for the kids",
            "flour for cooking",
        ]
        places = [
            "Boulder, CO",
            "Denver, CO",
            "Grand Junction, CO",
            "New York, NY",
            "Los Angeles, CA"
        ]
        10.times do
            need = Need.new({
                description: "I need #{needed.sample}.",
                instructions: "Give me help or supplies at #{places.sample}"
            })
            need.save
        end
    end
end
