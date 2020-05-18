extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : int = position.x
onready var targetX : int = position.x + moveDist

func _process(delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
	

func move_to(current, target, step):
	
	var new = current
	
	if new < target:
		new += step
		
		if new > target:
			new = target
	else:
		new -= step
		
		if new < target:
			new = target
	return new		
			

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
