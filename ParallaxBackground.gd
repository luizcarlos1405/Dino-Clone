extends ParallaxBackground

var parallax_offset = Vector2()

func _ready():
	get_node("ParallaxLayer/Chão").set_position(Vector2(0, 710))
	pass

func _process(delta):
	parallax_offset -= get_node("/root/Main").velocidade * -delta
	set_scroll_offset(parallax_offset)
	
	pass
