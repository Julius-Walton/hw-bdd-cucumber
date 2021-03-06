# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # movie is a hash for each row of the table
    # ! means create exception if anything goes wrong
    Movie.create!(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  Movie.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    if uncheck == "un"
        rating_list.split.each do |rating|
            uncheck("ratings_#{rating}")
        end
    elsif
        rating_list.split.each do |rating|
             check("ratings_#{rating}")
        end
    end
end

Then /I should (not )?see the following movies: (.*)/ do |notSee, movies|
    if notSee == "not "
        movies.split("/").each do |movie|
          if page.respond_to? :should
            page.should have_no_content(movie)
          else
            assert page.has_no_content?(movie)
          end
        end
    elsif
        movies.split("/").each do |movie|
          if page.respond_to? :should
            page.should have_content(movie)
          else
            assert page.has_content?(movie)
          end
        end
    end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
