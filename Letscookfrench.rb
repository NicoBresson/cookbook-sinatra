require 'open-uri'
require 'nokogiri'

class LetsCookFrench
  def get_recipes_from_web(keyword)
    html_file = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{keyword}&type=all")
    html_doc = Nokogiri::HTML(html_file)
    list_recipes = []
    html_doc.search('.m_contenu_resultat a').each do |element|
    list_recipes << element.text
    end
    return list_recipes
  end

  def get_recipes_details(keyword, selection)
    html_file = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{keyword}&type=all")
    html_doc = Nokogiri::HTML(html_file)
    recipe_details = {}
    html_doc.search('.m_contenu_resultat a').each do |element|
      if element.text == selection
        recipe_details[:description] = element.parent.parent.search('.m_detail_recette').text[/Recipe.+/]
        recipe_details[:cooking_time] = element.parent.parent.search('.m_detail_time').children[1].text[/\d+\smin/]
        recipe_details[:difficulty] = recipe_details[:description].split(' - ')[2]
      end
    end
    return recipe_details
  end
# p get_recipes_details('chocolate',"Chocolate Truffles")
end




