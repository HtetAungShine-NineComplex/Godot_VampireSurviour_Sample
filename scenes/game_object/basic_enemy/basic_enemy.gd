extends CharacterBody2D

const MAX_SPEED = 40

@onready var health_component:HealthComponent = $HealthComponent
@onready var player_node = get_tree().get_first_node_in_group("player") as Node2D


func _process(delta):
	var direction = get_direction_to_player()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
	
func _physics_process(delta):
	var moving_to_right := (velocity.x < 0)
	$Sprite2D.flip_h = moving_to_right	
	

func get_direction_to_player():	
	if player_node != null:
		return (player_node.global_position-global_position).normalized()
	return Vector2.ZERO

