# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Сега ще проверя дали API сървърът работи: curl -X GET http://localhost:4567/
* Сега ще тествам дали Rails приложението може да се свърже с API-то: curl -X POST http://localhost:4567/api/bodygraph -H "Content-Type: application/json" -d '{"name":"Test User","birth_date":"25/11/1996","birth_time":"11:48","birth_country":"Bulgaria (BG)","birth_city":"Sofia, Bulgaria"}'
* Сега ще проверя дали Rails сървърът работи: curl -X GET http://localhost:3001/
* Сега ще тествам интеграцията като направя заявка от Rails приложението към API-то:
#### 1) cd /Users/sonyft/projects/hdkit/hdkit_API/bodygraph_frontend && rails console
#### 2) cd /Users/sonyft/projects/hdkit/hdkit_API/bodygraph_frontend && echo 'BodygraphApiService.health_check' | rails console
* Сега ще тествам пълната функционалност: cd /Users/sonyft/projects/hdkit/hdkit_API/bodygraph_frontend && echo 'BodygraphApiService.generate_bodygraph({"name" => "Test User", "birth_date" => "25/11/1996", "birth_time" => "11:48", "birth_country" => "Bulgaria (BG)", "birth_city" => "Sofia, Bulgaria"})' | rails console
