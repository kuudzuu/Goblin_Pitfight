class_name Goblin extends Node

var id: String
var hp: float
var atk: float
var spd: float

static func create(new_id, params) -> Goblin:
	var goblin = Goblin.new()
	goblin.id = new_id
	goblin.hp = params["hp"]
	goblin.atk = params["atk"]
	goblin.spd = params["spd"]
	return goblin

## Goblins should have a bank of methods for attacking etc (entirely dependent on atk implemnentation)
## that they simply have references to. Allows for easy editing (+ modding)
## i think if i approach this as "make it as easy as possible to mod"
## i will also make it as easy as possible to develop lmao
