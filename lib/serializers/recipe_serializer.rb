class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, 
             :name, 
             :image, 
             :recipe_info, 
             :instructions,
             :ingredients,
             :nutrients
end