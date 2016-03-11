Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create(title: article["title"], body: article["body"], author: article["author"])

  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Comment.create(author: comment["author"], body: comment["body"], article_id: comment["article_id"])
  end
end

And /^I am logged into a non-admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'tiffany'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^(?:|I )click on "([^"]*)"$/ do |link|
  find('a', :text => link).click
end

