# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|

    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.

    if Movie.find_by_title( movie["title"] ) == nil 
      Movie.create!( movie )
    end
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
  regexp = /#{e1}.*#{e2}/m
  page.body.should =~ regexp
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb

  rating_list.split(",").each do |rating|
    step "I #{uncheck}check \"ratings_#{rating}\""
  end
end

Then /I should see all of the movies/ do
  #step "I should see \"The Terminator\""
  #step "I should see \"When Harry Met Sally\""
  #step "I should see \"Amelie\""
  #step "I should see \"The Incredibles\""
  #step "I should see \"Raiders of the Lost Ark\""
  #step "I should see \"Chicken Run\""
  #step "I should see \"2001: A Space Odyssey\""
  #step "I should see \"Aladdin\""
  #step "I should see \"The Help\""
  #step "I should see \"Chocolat\""
  rows = page.body.split("</tr>").size
  rows.should == 12 # para 10 esperados (abate 1 do cabeçalho e um da parte após o ultimo tr
end
