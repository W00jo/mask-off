@abstract 
class_name State 
extends Node
## A brief description of the class's role and functionality.
##
## The description of the script, what it can do,

signal transition(new_state_name: StringName)

## Co się dzieje na wejście do funkcji
## Np. print wszedł w funkcję
func _enter() -> void:
	pass

## Nie używamy
## Co się dzieje przy wyjściu z funkcji
func _exit() -> void:
	pass

## 
## 
func _update(_delta: float) -> void:
	pass

##
##
func _physics_update(_delta: float) -> void:
	pass
