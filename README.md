# Mask Off

## Overview
**Mask Off** is a fast-paced, local multiplayer beat-'em-up where players compete for powerful, game-changing masks. This project was developed for **LubJam 2026** / **Global Game Jam 2026**.

## [GGJ 2026 diversifiers](https://globalgamejam.org/global-game-jam-2026-diversifiers-have-arrived)
We have incorporated the following diversifiers:
* **Many Hands Make Light Work**: Designed for local multiplayer with up to four players.
* ~~**The World is Alive**: Every stationary object in our levels features custom animations.~~ [TODO]
* ~~**Cartridge Ready**: The final build is optimized to be under 10 MB.~~ [TODO].
* ~~**Diverse**: By including the three diversifiers above, we have achieved the "Diverse" challenge.~~

## Game design
* **Core Loop**: Wait for the timer, grab the Mask, and use unique power-ups to outplay your opponents.
* **USP**: Local 4-player mayhem, quirky mask-based power-ups, and three distinct maps.
* **Target**: Family-friendly (Rating: E).

## Project structure
Managed within the **Godot Engine** using **GDScript**.

res://
<br/>├── **assets/** → Art, audio, fonts, shaders
<br/>├── **config/** → Settings and translations
<br/>├── **global/** → Global scripts, like `game_manager.gd` or state machines
<br/>├── **docs/** → Notes and changelog
<br/>└── **src/** → Game scenes and their respective `scripts`

## How to run

Create a `project` in Godot.

## Naming conventions

These naming conventions follow the Godot Engine style. Breaking these will make your code clash with the built-in naming conventions, leading to inconsistent code. As a summary table:

| Type | Convention | Example |
| --- | --- | --- |
| File and folder names | snake_case | `game_manager.gd`, `enemy_sprite.png`, `` |
| class_name | PascalCase | `class_name Control` |
| Node names | PascalCase | `Camera3D`, `Player` |
| Functions | snake_case | `func load_level():` |
| Variables | snake_case | `var particle_effect` |
| Signals | snake_case | always in past tense `signal door_opened` |
| Constants | CONSTANT_CASE | `const MAX_SPEED = 200` |
| enum names | PascalCase | `enum Element` |
| enum members | CONSTANT_CASE | `{EARTH, WATER, AIR, FIRE}` |

## Code order

```gdscript
01. @tool, @icon, @static_unload
02. class_name
03. extends
04. ## doc comment

05. signals
06. enums
07. constants
08. static variables
09. @export variables
10. remaining regular variables
11. @onready variables

12. _static_init()
13. remaining static methods
14. overridden built-in virtual methods:
 1. _init()
 2. _enter_tree()
 3. _ready()
 4. _process()
 5. _physics_process()
 6. remaining virtual methods
15. overridden custom methods
16. remaining methods
17. subclasses
```

## Credits

* **Engine**: Godot 4.6. .NET
* **Design templates**: Based on Scott Rogers' *Level Up!*
* **Team**: [TODO]
