extends Node2D

var state = "no apples"
var player_in_area = false

var apple = preload("res://scenes/apple_collectable.tscn")

func _ready():
	if state == "no apples":
		$growth_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == "no apples":
		$AnimatedSprite2D.play("no_apples")
	elif state == "apples":
		$AnimatedSprite2D.play("apples")
		if player_in_area:
			if Input.is_action_just_pressed("e"):
				state = "no apples"
				drop_apple()

func drop_apple():
	var apple_instance = apple.instantiate()
	apple_instance.global_position = $Marker2D.global_position
	get_parent().add_child(apple_instance)
	$growth_timer.start()
	
	await get_tree().create_timer(3).timeout
	
func _on_pickeable_area_body_entered(body):
	if body is CharacterBody2D:
		player_in_area = true


func _on_pickeable_area_body_exited(body):
	if body is CharacterBody2D: 
		player_in_area = false

func _on_growth_timer_timeout():
	state = "apples"
