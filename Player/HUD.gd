extends Control

signal attack_pressed()

var player
var attack_moves = []
var combat_queue

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    player = get_parent()
    

func enter_combat_mode():
    get_node('./AttackMode').visible = true

    get_node('MODE').text = "COMBAT MODE"
    get_node('MODE').add_color_override("font_color", Color(1,0,0,1))
    
    combat_queue = player.get_my_combat_queue()
    
    attack_moves = combat_queue.get_children()
    for attack in attack_moves:
        var use_attack_button = Button.new()
        use_attack_button.text = attack.attack_name

        use_attack_button.connect('pressed', self, '_on_attack_pressed', [attack])
        # we need to connect this button pressed() to _on_attack_pressed
        get_node('./AttackMode/AttackMenu').add_child(use_attack_button)

func _on_attack_pressed(attack):
    print("Attack pressed:", attack)
    combat_queue.append_new_move(attack)

    var label = Label.new()
    label.text = attack.attack_name
    get_node('./AttackMode/CombatQueue/QueuedMoves').add_child(label)

#   On the attack menu, when I load I want to get all atack moves and show them in the 
# attack Menu as optionMenu as options

#   When I click an attack,
