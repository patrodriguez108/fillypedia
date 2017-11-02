module FormHelper

  # outputs a nested array, where each inner-array contains
  # [category.title, category.id]
  def categories_for_dropdown
    categories = Category.all.map do |category|
      [category.title, category.id.to_i]
    end
  end

end

