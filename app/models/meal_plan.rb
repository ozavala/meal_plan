class MealPlan < ApplicationRecord
  belongs_to :user

validates :start_date, presence: true
validates :end_date, presence: true
validates :user, presence: true

def build_meals
    user_recipe_ids = user.recipes.pluck(:id)

    (start_date..end_date).each do |date|
      unused_recipes = user_recipe_ids - meals.map(&:recipe_id)
      
      if unused_recipe_ids.empty?
        available_recipe_ids = user_recipe_ids
      else
        available_recipe_ids = unused_recipe_ids
      end

    #available_recipes = unused_recipes.empty? ? user_recipe_ids : unused_recipes
      meals.build(date: date, recipe_id: available_recipes.sample)
    end
  end

end
