json.animals @animals.each do |animal|
  json.id animal.id
  json.code animal.code
  json.species animal.animal_type.species
end
