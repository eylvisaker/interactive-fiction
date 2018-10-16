"Castle of Spirits" by Anthony Maro, converted to I7 by Erik Ylvisaker
[ 
In January of 1989, I received my very first Commodore Magazine. I was 10 years old and had been gifted a subscription 
for Christmas. Inside, it had a program listing for a really neat sounding game, the Castle of Spirits. 
I had never played a text adventure before, but I typed the listing in, and after a lot of frustration from a well hidden bug,
I eventually got it working, and it was really fun. I even used the engine to write my own text adventure. 

So when I discovered Inform 7, I decided a fun way to learn it would be to port Castle of Spirits.

I made a few minor changes, most notably to give the player a bit more time before the vampire shows up and add a
help command.
]

Release along with an interpreter.

The time of day is 11:35 PM.

When play begins: 
	now the left hand status line is 
		"[the player's surroundings] / [turn count] / [score]"; 
	now the right hand status line is "Time: [time of day]".

At 11:45 PM:
	say "Gee, it's getting late. Almost midnight. I sure hope nothing bad happens."

At 12:00 AM:
	if the player carries the garlic bloom:
		say "You quite suddenly are interrupted by an overpowering vampire. He takes one sniff of your garlic, sticks up his nose and then flies away.";
	otherwise:
		say "You quite suddenly are interrupted by an overpowering vampire. While struggling for your life he calmly drinks your blood. You have died.";
		end the story.
			
Oiling is an action applying to one thing.
Understand "oil [something]" as oiling.
Understand "lubricate [something]" as oiling.
Instead of oiling something, say "I don't understand you."
Instead of oiling a door:
	if the player carries the oil can:
		say "OK.";
		now the noun is openable;
	otherwise:
		say "You don't have any oil!";

Does the player mean oiling an openable door: it is very unlikely.

Instead of going nowhere, say "Something solid hits you in the face."

The castle is a backdrop. The castle is everywhere. 
Instead of entering the castle, say "You're already in the castle. It's spooky here, and you should be trying to find your way out."

Courtyard is a room. "You are in a large courtyard with a dilapidated shed in the corner. The south edge is lined by an old stone wall with a portcullis in the middle.[if not visited]

Whilst going about your business a more than slightly deranged apparition appears. He seems to be screaming some nonsense about no escape. The ghost very impolitely laughs in your face, then vanishes to whatever unsightly place he appeared from.

Type HELP to get help.[end if]".
The portcullis is scenery in the courtyard. Instead of entering the portcullis, say "The portcullis is very solidly closed. It would take an act of god to move it."

ByTheGates is a room. The printed name is "By the Gates". "There is a monstrous gate set in the north wall.  To the south is the courtyard and to the east is a small house." It is north of courtyard. The house is scenery in ByTheGates. Instead of entering the house, try going east. The gate is scenery in ByTheGates. Instead of entering the gate, try going north. 
The ghost is scenery in ByTheGates. "The ghostly knight is wearing a full suit of decidedly un-ghostly armor." Understand "knight" as the ghost. Understand "guard" as the ghost. 

Seen the ghost is a truth state that varies. Seen the ghost is false.

Instead of going north in bythegates:
	if the player carries the car battery and the player carries the electromagnet:
		say "The ghostly guard is apparently scared of the magnet and refuses to come near you. You very casually stroll out of the castle. CONGRATULATIONS from Anthony Maro, original programmer, and Erik Ylvisaker, inform port programmer.";
		end the story finally;
	otherwise:
		say "A ghostly knight in a full suit of armor refuses to let you pass.";
		now seen the ghost is true.

East Courtyard is a room. "This is the east courtyard. A small gap exists in the south wall of the castle. A domineering tower stands silhouetted against the sky, the entrance of which is covered in vines." It is east of courtyard. The printed name is "E. Courtyard".
The gap is scenery in East Courtyard. Instead of entering the gap, try going south.

Gap in Wall is a room. "You stand in a small gap in the wall of which the only exit is north." It is south of east courtyard. An electromagnet is in gap in wall. Understand "magnet" as the electromagnet.

West Courtyard is a room. "This is the west courtyard. The stables are to the south, and a domineering tower stands silhouetted against the sky, the entrance of which is covered in vines." It is west of courtyard. The printed name is "W. Courtyard". The stablesfacade is scenery in West Courtyard. The printed name is "stables". Instead of entering the stablesfacade, try going south.

Stables is a room. "You stand in the stables, which have apparently not been kept very clean."There is a garlic bloom in stables.

The stable door is a door. It is scenery. It is south of west courtyard and north of stables. It is closed and locked. It is unlocked by the key. 
Does the player mean unlocking stable door with something: it is very likely.

Tool shed is a room. "There are various tools and other items of no or some interest in the tool shed. The entrance is north." North from tool shed is courtyard. South from courtyard is nowhere. Inside from courtyard is tool shed.
There is an oil can in tool shed. There is an old shovel in tool shed.

There is a thing called the shed. It is scenery. The shed is in courtyard. Instead of entering the shed, try going inside.

Tower Lower W is a room. "This is the bottom floor of one of the many towers in this castle. An exit is south of here." The printed name is "Tower". A car battery is in tower lower W.

Tower Door W is a door. The printed name is "tower door". It is not proper-named. It is scenery. It is inside from west courtyard and south from tower lower W. It is closed and unopenable. Instead of opening tower door w when tower door w is unopenable, say "The door is stuck!"
Does the player mean unlocking tower door w with something: it is very unlikely.

Tower Upper W is a room. "The endless floors all appear the same in this tower. Up or down?" The printed name is "Tower". Tower Upper W is up from Tower Upper W . Tower Lower W is down from Tower Upper W.

Tower Lower E is a room. "This is the bottom floor of one of the many towers in this castle. An exit is south of here." The printed name is "Tower".

Tower Door E is a door. The printed name is "tower door".  It is not proper-named. It is scenery. It is inside from east courtyard and south from tower lower E. It is closed and unopenable. Instead of opening tower door e when tower door e is unopenable, say "The door is stuck!"

Tower Upper E is a room. "The endless floors all appear the same in this tower. Up or down?" The printed name is "Tower". Tower Upper E is up from Tower Upper E. Tower Lower E is down from Tower Upper E.

Guard Quarters is a room. "This is a small guard's shack. Various everyday items are on the floor." It is east of bythegates. 

There is a black box in guard quarters. The description is "There are three buttons the color of a traffic light imbedded in the side."
The green button is part of the box.
The yellow button is part of the box.
The red button is part of the box.
Box-state is a number that varies. Box-state is usually zero.

Instead of pushing the green button:
	if box-state is zero:
		increment box-state;
		say "CLICK.";
	otherwise:
		say "Boom!!!!";
		say "Oops!";
		end the story.
		
Instead of pushing the yellow button:
	if box-state is one:
		increment box-state;
		say "The box opens and I now have a key.";
		now the player carries the key;
	otherwise:
		say "Boom!!!!";
		say "Oops!";
		end the story.
		
Instead of pushing the red button:
	say "Boom!!!!";
	say "You made a mistake!";
	end the story.
	
Understand "help" as asking for help. Asking for help is an action applying to nothing.

Instead of asking for help:
	if the player is carrying the garlic:
		if the player is carrying the electromagnet and the player is carrying the car battery:
			if seen the ghost is true:
				say "I bet that ghost would like to see your shiny new electromagnet.";
			otherwise:
				say "There's not much more I can help with! Try looking for an exit.";
		otherwise if the player is carrying the electromagnet:
			if tower door w is openable:
				say "You already oiled the tower door, why don't you go inside?";
			if the player is in west courtyard and tower door w is unopenable:
				if the player is carrying the oil can:
					say "Hmm.. that door is stuck. Maybe there's a way to lubricate it?";
				otherwise:
					say "That door looks like it could use some oil.";
			otherwise if the player is in east courtyard and tower door e is unopenable:
				if the player is carrying the oil can:
					say "Hmm.. that door is stuck. Maybe there's a way to lubricate it?";
				otherwise:
					say "That door looks like it could use some oil.";
			otherwise if tower door e is openable:
				say "Wait, I thought there was another stuck door at the other tower.";
			otherwise:
				say "If you just had a source of power, that electromagnet you're lugging around might just come in handy. Wasn't there a stuck door around here? I wonder if you can get it unstuck.";
		otherwise if the player is carrying the car battery:
			say "The car battery seems fully charged, just waiting for something to power.";
		otherwise:
			say "There must be something around here you can use to escape.";
	otherwise if the player is carrying the key:
		say "Wasn't there a locked door around here somewhere?";
	otherwise if the player is carrying the box:
		say "The sure was an odd box. You might want to look at it more closely.";
	otherwise:
		say "Move by typing 'Go North', 'Go N', or just 'N'. You can also use South, East or West. Enter can be used to enter some buildings. Look At can be used to examine your surroundings or objects. Try an explore to see if you can find a way out of the castle.";
		
		