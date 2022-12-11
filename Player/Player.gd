extends Spatial

var HUD
var animation_player
var focused_enemy
var combat_queue

func _ready():
    HUD = get_node('HUD')
    HUD.connect('attack_pressed', self, 'push_attack_to_queue')
    animation_player = get_node('./KinematicBody/AnimationPlayer')

    combat_queue = get_node('PlayerCombatQueue')

func set_focused_enemy(enemy):
    if (!focused_enemy):
        HUD.enter_combat_mode()

    focused_enemy = enemy

func push_attack_to_queue(attack):
    combat_queue.append_new_move(attack)

func get_my_combat_queue():
    return combat_queue
