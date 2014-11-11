# SmartManaging

SmartManaging is a tool which allow create easily a beautiful management interface while keeping the agility and the power of Rails.

## Demo

You can find a demo application [here](https://demo-smart-managing.herokuapp.com) and the source of the demo [here](https://github.com/GCorbel/demo-smart-managing).

## Install in an existing project

SmartManging uses SmartListing, SimpleForm and Twitter-Bootsrap. You must to
install it before to install SmartManaging.

To install SmartManaging you have to add this in your Gemfile :
```ruby
gem 'smart_listing', github: 'GCorbel/smart_listing'
gem 'smart_managing'
```

Bundle it by using the command `bundle install`.

Finally, you must to add this line in you controller :
```ruby
include SmartManaging::ControllerHelpers
```

## Start from scratch

Here is an example of managing interface in less than 30 seconds

Create the application :
```console
rails new UserManagement --skip-bundle
cd UserManagement
```

Add this in your Gemfile :
```ruby
gem 'smart_listing', github: 'GCorbel/smart_listing', branch: 'refactoring'
gem 'smart_managing'
```

Run this command to download the gem with Bundler :
```console
bundle install
```

Install SimpleForm by typing this command :
```console
rails generate simple_form:install
```

Install SmartManaging by running this command :
```console
rails generate smart_managing:install
```

Create a new model, for example :
```console
rails generate model User name email age:integer
rake db:migrate
```

Edit the `config/routes.rb` and add :
```ruby
resources :users
```

Open the file `app/assets/javascripts/application.js` and, before `//= require_tree .`, add this :
```
//= require bootstrap
//= require smart_listing
```

Rename the file `app/assets/stylesheets/application.css` to `app/assets/stylesheets/application.css.scss` and, at the bottom of the file, add this :
```scss
@import "bootstrap-sprockets";
@import "bootstrap";
```

Create a file named `app/controllers/users_controller.rb` and add this :
```ruby
class UsersController < ApplicationController
  include SmartManaging::ControllerHelpers
  # ... Your code
end
```

For a more simple controller, you can use [inherited_resources](https://github.com/josevalim/inherited_resources) but it's not mandatory.

Done! You can start the application by running `rails server` and go to http://localhost:3000.

## Customize the managers
You can change the behavior of the SmartManaging for a specific model by creating a directory `app/managers` and a manager object. For exemple, you can have the file `user_manager.rb` which contain :

```ruby
class UserManager < SmartManaging::Base
  def editable_attributes
    ['name']
  end

  def attributes
    ['name', 'email']
  end
end
```

This will show only the names and emails and allow to edit only the names.

A manager class must inherited from `SmartManaging::Base` and override his methods, for the complete list of overrideable methods, you can check [this file](https://github.com/GCorbel/smart_managing/blob/master/app/managers/smart_managing/base.rb).

You can specify a manager in the controller by overriding the `manager` method. For example, you can do this :

```ruby
def manager
  @manager ||= CustomManager.new(self)
end
```
