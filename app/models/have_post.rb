class HavePost < ApplicationRecord
  belongs_to :entity, optional: true
  belongs_to :location, optional: true
  belongs_to :category, class_name: "NeedCategory", optional: true
end
