# GE1-2023Assignment1

My assignment for this semester aims to be a cooking game developed in the Godot engine in which users bake a cake by mixing ingredients and baking too. Points are earned for completion.

# Project Title Cooking Pancakes
* Name: Olabode Balinga     
* Student Number: C20478706
* Video Link: https://www.youtube.com/watch?v=6XpFlrvUkqU

# Description of project
A simple cooking game made using the Godot Engine in which users can click on the ingridents (Eggs, Milk, Flour) as they drop into the mixing bowl. Stir the mixing bowl using the whisk to create your batter and pour it into the pan on the next screen to create your pancakes. Points are rewarded for how well you cook your pancakes.

# Instructions for use
Use the left mouse button to click on the ingridients and the click the whisk to make it follow the mouse. Use the right click mouse button to drop the whisk. Use the right key or 'd' key to hover to the next screen  which is the stove section in which when your batter has been completed (noted when the objective is shown above) and also the left and 'a' key to hover back to the baking area. In the stove section, you click the red switch to turn it on. You will know when it has been successfully done, when the hob turns slightly red. Clicking on the pan will drop your pancake batter onto it, where you cook it and wait until the 'Take out' label appears. When clicking on this, the pancake would be taken out of the pan and placed onto the white plate on top of the second hob. Depending on how fast you take out the pancake, you will be awarded points. Failure to get the pancake on time will grant you a burnt pancake which awards 0 points so be careful. Repeat the steps until all 5 pancakes have been made.

# How it works:
1. The game works by clicking the ingridients that are on the table. In this game, there are 4 ingridients, flour, 2 eggs and milk bottle and they are ought to be clicked and placed onto the mixing bowl. This is done through the use of Area3D nodes, more specifically the input_event from the CollisionObject3D node. When the input_event detects the mouse left button being pressed on that object, it sends a signal to the mixing bowl signifying that the respective object has been selected and adds a score of 10 points each time. This signal is also sent to a spawner object that is placed above the mixing bowl where it creates an instantiated object of the dropped object scene. e.g. when clicking eggs, it will instantiate the dropped egg scene which are cracked eggs. At the same time, the respective item is added to an array in the mixing bowl script and when this array reaches 4 (meaning all 4 items have been addeed) it sends a signal to the whisk object saying that it is time to start the mixing phase while also writting the current objective to stir the whisk. 

2. The whisk stirring works, by detecting if the whisk is actually moving in the area using the body_entered from the Area3D. If it is, a counter is added until it reaches 15 and it sends another signal saying that the object has been mixed. Updating the color of the batter to be lightish yellow and adding a score of 100 in the process. 

3. The next phase is the pancake making process in which users have to click the switch, which once again uses an area3D node to detect mouse input. It then updates the status variable to the opposite of what it once was. At default the staus variable is set to be false. When the status is true, it sends a signal to the pan object, noting that it is time to start the frying phase and it also sends a signal to the hob to change the color to slightly red. When the user clicks on the pan, it sends a signal to the pancakeSpawner object on top of the hob object where it spawns the pancake instance scene, if the pancake count is not 0. At default it is at 5 and decreases per each pancake made. A timer is set on the pancake for 8 seconds, that notes whether or not the pancake should be taken out and another timer is set for 20 seconds that notes whether or not the pancake is burning. The color of the pancake changes depending on how much time is left and the pancakeScore is also dependent on this, ranging from 0 to 100 (0, 20, 30, 60, 80, 100). When the pancake is ready to be taken out, a signal is sent to the pancake instance, on_pancake_clicked() where it sends the current pancakeScore and moves the pancake to above the plate object and adding the pancakeScore to the current score in the proccess. It recieves the score variable, by taking in the current score string from the ScorePanel and converting it into an integer, when the mixing process was completed. 

4. When all 5 pancakes have been made, the current objective shifts depending on the total score.

# List of classes/assets in the project
All of the models were self-made using blender, a free to use modeling software. The audio assets were taken from the site freesound.com

* 101387_malakadew_ms.mp3
* 278204_ianstagrem_switch-flip-2.wav
* 573997_mystudio_pouring-milk1.mp3
* 625755_blizzardlady_stove-turning-on.wav
* 336612_anthousai_egg-crack-02.wav
* 353124_benjaminnelan_frying-pan-sizzle.wav

* The .wav files were then converted into .mp3 format for use in the Godot engine

Most of the scripts were self-made, with the exception of few sources, one being the whisk mouse movement which was modified from source1, where I needed a way to find the mouse position for a 3D game, which was something that was needed to move the whisk.

The other source that was used was to learn how to send signals between different scenes, which was something I needed to learn in order for my instanciated object such as the pancake to be able to be clicked and have movement respective to the current scene. Obtained from source2.

The final source was how to instantiate an object to be able to spawn them. This was mainly used throughout the game to drop the ingredients into the mixing bowl when clicked and also dropping the batter pan.

# References
1.   Source1: https://www.youtube.com/watch?v=jvxeHSotKpg
2.   Source2: https://forum.godotengine.org/t/how-do-i-connect-signals-between-scenes/19778
3.   Source3: https://www.youtube.com/watch?v=rbaxXLtpSVg

# What I am most proud of in the assignment 
What I am most proud of in the assignment, is finally making a simple 3D Godot project. Additionally, getting the score and objective system, while simplistic in nature, was quite fun to work with. In addition to this, getting the mouse movement with the whisk, while buggy in nature due to the conflicting collisions nearby was still fine enough for me as it allows users to stir the batter to create the pancake batter. Though, there were some features, that I would have liked added such as music, fruit pancakes and butter (evident from the unused butter and knife model), I am happy with how the game is right now, as my main objective was with this project was just to create a simplistic game using the Godot Engine

# What I learned
What I learned in this assignment is learning how to truly use the node system in order to connect signals together. Compared to Unity, the signal system allows for easy transfer of variables and key signals with relative ease and is one of the best things about the engine. Although, I have yet to master this system, as I tend to over use to connect to scripts that are not relevant, as finding the node simply does the job, I hope in the future I can learn to use them better. Speaking of Unity, the one thing I had to come to realize, is that Unity and Godot have a completely different feel. My Unity knowledge when it came to scripts and constructing, did not translate well to Godot, so I had to take some steps back and learn how to utilize certain features. Also in Blender, I had to learn how to use the geometry node system in order to create the flour object. This was mainly referenced from https://blender.stackexchange.com/questions/291809/powder-in-a-pile . Also, learning how to deform mesh along curves was a bit of a challenge to learn, in order to create the whisk object.
