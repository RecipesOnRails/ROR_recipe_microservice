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
  
  ### Get recipe search
  
  **Required** params:  
    * `ingredient` 
  
  **Optional** params:  
    * `diet` 
    
    
    ` GET https://pure-chamber-22336.herokuapp.com/api/v1//recipes/complexSearch `
    
    ` {"data": [
        {
            "id": "id",
            "type": "search",
            "attributes": {
                "id": id,
                "title": "Recipe name",
                "image": "Image URL",
                "cuisine": "Recipe cuisine",
                "calories": calories
            }
          }
        ]
      } ` 
      
## Built With

- Sinatra
- RSpec
- Rubocop
- Simplecov
- 
## Authors
* **Megan Gonzales** -- [GitHub](https://github.com/MGonzales26) |
  [LinkedIn](https://www.linkedin.com/in/megan-e-gonzales/)
* **Jacob Arellano** -- [GitHub](https://github.com/jakejakearell) |
  [LinkedIn](https://www.linkedin.com/in/jacob-arellano-ab2890207/)
* **Arika Blenker** -- [GitHub](https://github.com/arikalea) |
  [LinkedIn](https://www.linkedin.com/in/arika-blenker/)
* **Harrison Blake** -- [GitHub](https://github.com/harrison-blake) |
  [LinkedIn](https://www.linkedin.com/in/harrison-blake-802094200/)
* **Hope McGee** -- [GitHub](https://github.com/hopesgit) |
  [LinkedIn](https://www.linkedin.com/in/hope-mcgee/)
* **Trevor Robinson** -- [GitHub](https://github.com/Trevor-Robinson) |
  [LinkedIn](https://www.linkedin.com/in/trevor-robinson-0bb251207/)
* **Jeremiah Michlitsch** -- [GitHub](https://github.com/jmichlitsch) |
  [LinkedIn](https://www.linkedin.com/in/jeremiah-michlitsch-49048a206/)
  
See also the list of [contributors](https://github.com/RecipesOnRails/ROR-Front-End/graphs/contributors)
