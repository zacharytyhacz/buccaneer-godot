extends Node

var player
var enemies
var currently_selected_enemy
var attack_queue_referee

func _on_enemy_clicked(enemy):
    currently_selected_enemy = enemy
    player.set_focused_enemy(enemy)

func _ready():
    enemies = get_tree().get_nodes_in_group("enemy_group")

    for enemy in enemies:
        enemy.connect("clicked", self, "_on_enemy_clicked")

    player = get_node('Player')
