require 'fast_jsonapi'

class RecipeSerializer
  include FastJsonapi::ObjectSerializer

  set_id :id
  attributes :name,
             :image,
             :recipe_info,
             :instructions,
             :ingredients,
             :nutrients
end
