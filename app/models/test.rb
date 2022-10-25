class Test < ApplicationRecord
  def self.test_by_category(category)
    Test.joins("categories")
      .where(categories: { title: category })
      .order(title: desc)
      .pluck(:title)
  end
end
