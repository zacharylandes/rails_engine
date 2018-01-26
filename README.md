# README

Rails Engine

The Rails Engine API allows users to hit api endpoints that contain a variety of data relating to customers, transactions, invoices and items. It also  performs business analytics on these resources

This project requires  Ruby version 2.4.1 and rails 5.4.1 

Set Up

Fork this repository on Github.

visit your forked repo and clone your forked repository in to the directory of your choosing with

``   git clone https://github.com/zacharylandes/rails_engine.git        ``

in your terminal , type:

 `` cd rails_engine

run  bundle install

then initiatiate the migration of your database

run :

rake db:create

	rake db:migrate
	rake import  
 this may take a few minutes
Run rspec to run your test suite 

then type rails s to start your server.

in a new terminal window and in any directory other than the rails engine project directory

 run:

cd ..

git clone https://github.com/turingschool/rales_engine_spec_harness.git
cd rales_engine_spec_harness
bundle
bundle exe rake


to run the spec harness.

