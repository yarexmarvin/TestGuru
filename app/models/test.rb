class Test < ApplicationRecord
  def self.test_by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
