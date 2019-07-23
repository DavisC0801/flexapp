require 'rails_helper'

RSpec.describe Recipe do
  before :each do
    @recipe = Recipe.new({
      name: 'New Recipe',
      url: 'www.google.com',
      calories_per_serving: 200,
      carbs_per_serving: 10,
      protein_per_serving: 8,
      thumbnail: 'https://avatars0.githubusercontent.com/u/18176968?s=460&v=4',
      servings: 3
      })
  end

  it "exists" do
    expect(@recipe).to be_a Recipe
  end

  it "has attributes" do
    expect(@recipe.name).to eq('New Recipe')
    expect(@recipe.url).to eq('www.google.com')
    expect(@recipe.calories).to eq(200)
    expect(@recipe.carbs).to eq(10)
    expect(@recipe.protein).to eq(8)
    expect(@recipe.img).to eq('https://avatars0.githubusercontent.com/u/18176968?s=460&v=4')
    expect(@recipe.servings).to eq(3)
  end
end
