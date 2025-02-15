# How to run

The project only has one dependency for tests, so for running the main app, no need to do anything other than executing the main app.rb file (keep in mind it uses ruby 3.4.1)

```ruby
ruby app.rb
```

If you want to execute the test suite, you can use bundler. 

```
bundle install
bundle exec rspec
```

# Before review, please consider... 

1. I decided to focus only on the backend part, given the time constraints of this assignment, particularly as Rails was explictly forbidden. As such, this app works like a CLI.
1. I spent a great deal of the time solving floating point issues and rounding issues. I could have definitely worked more on the validation of the input, but I was already over the four hour mark.
1. Although I worked with RoR for several years, I also worked simultaneously with NodeJS and Python (and React!). As it's been a while since I've done Ruby alone, some of this code might not be "idiomatic."
1. Because of the nature of the CLI app and the time constraint, there was NOT a convenient dropdown/selector for product category and so the logic puts the onus on the user for accurately identifying if it's a book/food/etc for taxation.

# How the app works

![image](https://github.com/user-attachments/assets/e8943ef7-1191-4835-9f70-1db540fa6934)

First it will ask for the product name/desc. Type it and press enter. Then it will prompt for the amount. Then it will ask for the price. Finally it will ask three yes/no questions, which you need to either type "y" or "n".

1. Is the item food/book/medical?
2. Is the item imported?
3. Do you want to add another item?

If you answer the last question "n" it will print the receipt. 

If you answer "y" the questions will start again.
