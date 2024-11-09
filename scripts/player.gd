extends CharacterBody2D


var SPEED = 150
var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
	else:
		player_state = "walking"
		
	velocity = direction * SPEED
	move_and_slide()
	play_animation(direction)

func play_animation(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
		
	if player_state == "walking":
		match [int(velocity.x),int(velocity.y)]:
			[0,-150]:
				$AnimatedSprite2D.play("n-walk")
			[0,150]:
				$AnimatedSprite2D.play("s-walk")
			[-150,0]:
				$AnimatedSprite2D.play("w-walk")
			[150,0]:
				$AnimatedSprite2D.play("e-walk")
			[106,-106]:
				$AnimatedSprite2D.play("ne-walk")
			[106,106]:
				$AnimatedSprite2D.play("se-walk")
			[-106,106]:
				$AnimatedSprite2D.play("sw-walk")
			[-106,-106]:
				$AnimatedSprite2D.play("nw-walk")
		
		
		
