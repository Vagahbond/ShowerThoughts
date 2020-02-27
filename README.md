# ShowerThoughts
The aim of this API project is for a group of learning developers to learn how to cope with teamwork and VCS.
Therefor, it has a closed set of contributors that all have the same level. 
# Usage

get all the showerthoughts

``get 'showerthoughts/'``
<br><br>

get a showerthought for the specified ID

``get 'showerthoughts/:id'``
<br><br>

Get the :amount most popular showerthoughts

``get 'showerthoughts/most_popular/:amount'``
<br><br>

Get the :amount most comment showerthoughts

``get 'showerthoughts/most_commented/:amount'``
<br><br>

Get the number of recorded showerthoughts

``get 'showerthoughts/count'``
<br><br>

Get the showerthought corresponding to a specified comment

``get 'showerthoughts/by_comment/:comment_id'``
<br><br>

Get the showerthoughts for the specified user

``get 'showerthoughts/by_user/:user_id'``
<br><br>

get all the showerthoughts having the specified tag

``get 'showerthoughts/by_tag/:tag'``
<br><br>

Create a showerthought taking a showerthought json object as argument 

``post 'showerthoughts'``
<br><br>

Tag a showerthought with a json specified tag.

``post 'showerthoughts/tag'``
<br><br>

Delete specified showerthought

``delete 'showerthoughts/:id'``
<br><br>

Get a showerthought for a specified user (to fix)

``get '/showerthoughts/:id/user'``
<br><br>

Get a the author of a specified (showerthought)

``get '/comments/:id/user'``
<br><br>

# Contributing
Contributing is only allowed to the group's developers. 

This app works with two docker containers, pulled with the `docker-compose.yml` from two docker-hub images : 
   * yfirroloni/showerthoughts => a customised version of the Ruby image
   * the official postgres image.

Each time the development environment is setup, the rails app migrates its data structure into the database.

## Adopted VCS conventions

### Feature branch workflow
A branch should be created for each new **feature**, and then merged into the **master** branch once the feature is tested.
This workflow is only adapted to closed teams sharing a similar experience in terms of coding, where each developer has at least a basic understanding of how git works.

The adopted naming practice for this project's branches is the following :
`token/short-name` 

Example of token : `feature`, `doc`

Example of name : `tags`, `users`


### Commit naming convention
The commit names have to follow [this convention.](https://www.conventionalcommits.org/en/v1.0.0/) 

## Setting up environment
### Requirements to debug locally
  * [Ruby](https://www.ruby-lang.org/) (**2.7.0**)
  * [Rails](https://rubyonrails.org/) (**6.0.2.1**)
  * [Docker](https://www.docker.com/)
> It is recommended to use RubyMine as an IDE to ensure that our environment setting up steps work for you. 

> As long as no change in the database is planned, development environment can be setup without Ruby or Rails on the local machine, 
> thanks to the byebug and rubocop gems in the gemfile. RubyMine can use those gems in the docker to debug the code.
### Gem dependencies 
General :
   * `gem 'rails'`
   * `gem 'pg'`
   * `gem 'puma'`
   * `gem 'jbuilder'`
   * `gem 'bootsnap'`
   * `gem 'tzinfo-data'`
   
Development and test :
   * `gem 'byebug'`
   * `gem 'dotenv-rails'`
   * `gem 'faker'`
   * `gem 'rubocop'`
   
Development only : 
   * `gem 'spring'`
   * `gem 'spring-watcher-listen'`
   * `gem 'listen'`

### Download and execute
Steps to download the repository and run the app : 
1. Clone the repository : ``git clone https://github.com/vagahbond/ShowerThoughts``
2. Create a `.env` file at the root of the project , following this example: 
    ```
    DATABASE_URL="postgres://root:mysecretpassword@db:5432/showerthoughts?encoding=utf8&pool=5&timeout=5000"
    RAILS_ENV="development"
    PORT=3000
    ```
3. Run the docker containers : ``docker-compose up``

The project has been set up using RubyMine so this setup is not guaranteed to work with other IDEs.

## License
[MIT](https://choosealicense.com/licenses/mit/)