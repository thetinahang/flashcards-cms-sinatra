require './config/environment'




use Rack::MethodOverride
use UsersController
use StacksController
use FlashcardsController
run ApplicationController