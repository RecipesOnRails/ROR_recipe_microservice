require 'fast_jsonapi'

class SearchSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :title,
             :image,
             :cuisine,
             :calories
end
