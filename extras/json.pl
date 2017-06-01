:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).

:- json_object
	point(x:integer, y:integer) + [type=point].

:- json_object
	robo(n:string) + [type=robo].
