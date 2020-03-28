class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Takes a random-ish subset of records efficiently
  scope :take_sample, -> (limit) {
    start = Random.rand(self.count) - limit + 1
    finish = start + (limit * 2)
    self.where('id >= ? AND id < ?', start, finish).sample(limit)
  }
end
