# Recipes on Rails - Spoonacular Microservice

We utilized the [Spoonacular Public APIs](https://spoonacular.com/food-api) to access all of our recipe information in this project. 

## Endpoints

  ### Get recipe info
  
  **Required** params:  
    * `recipe id` 
  
    
    ` GET https://pure-chamber-22336.herokuapp.com/api/v1/recipes/#{id} `
    
    ` {"data": {
          "id": "id",
          "type": "recipe",
          "attributes": {
              "id": id,
              "name": "Recipe name",
              "image": "Image URL",
              "recipe_info": "Recipe summary",
              "instructions": [
                  {
                    "step": 1, 
                    "instruction": "First instruction" 
                   },
                  {
                    "step": 2, 
                    "instruction": "Second instruction"
                   }
              ],
              "ingedients": [
                  {
                    "name": "Ingredient name",
                    "amount": "Amount"
                   },
              "nutrients":  [
                  {
                    "name": "Calories",
                    "amount": "Amount:
                   }
              ]     
            }
          }
        } `
    
    
## Built With

- Sinatra
- RSpec
- Rubocop
- Simplecov
