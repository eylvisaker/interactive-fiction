"Life Boat" by Anthony Maro, converted to I7 by Erik Ylvisaker
[
Like Castle of Spirits, Life Boat was a game I found in Commodore Magazine. I ported it to Inform 7 for fun.
]

Release along with an interpreter.

Launch time is a number which varies. Launch time is -1.
Helping is an action applying to nothing.
Understand "help" as helping.
Instead of helping:
	say "Type something."
Instead of helping when the location is computer room:
	say "Type something here!"
	
Typing is an action applying to nothing.
Understand "type something" as typing.
Understand "type" as typing.

Opening it with is an action applying to two things.
Understand "open [something] with [something]" as opening it with.

Your cabin is a room. "You sit within your room, contemplating what to do next. The doorway is in the east wall, but the furnishings are too enticing to leave.[if not visited]

You hear explosions![end if]"

A keycard is a thing.

A large bed is in your cabin. 
After pushing the bed for the first time:
	move the keycard to your cabin;
	say "You find a keycard."

Hallway is a room. "You stand just outside your expensive cabin on the luxury liner. The hallway runs north-south with your cabin to the west. Sirens wail within the ship."

cabin door is a closed locked scenery door. It is east of your cabin and west of hallway. It is unlocked by the keycard.

Engine room is a room. "This is the master engine room. A shrill sound echoes from the northern crawlway. A rusted door exits to the south."
A hatch in the floor is in engine room.

Cargo is a room. Cargo can be pressurized. Cargo is not pressurized. "All of these crates contain cargo to be taken to your destination. A few might contain spare parts. Doors lead north and south."
A large crate is in cargo. The crate is a closed unopenable container. Inside the crate is a small device. 

Instead of opening the crate:
	if the player carries the crowbar:
		say "You find something!";
		now the crate is open;
		try examining the crate;
	otherwise:
		say "The crate is sealed pretty good.";

Instead of going south from passageway a when cargo is not pressurized:
	say "Cargo is not pressurized."

Instead of going north from passageway b when cargo is not pressurized:
	say "Cargo is not pressurized."

Computer room is a room. Computer room is south from passageway b. "Strewn about the floor of this computer room are broken memory crystals, apparently from the ship's main computer. A locked hatch is in the floor, and exits are north and south."
Instead of typing when the location is computer room:
	say "The screen replies:[line break]";
	say "Enter 1 to pressurize cargo.";
	say "Enter 2 to activate LifeBoat.";
	now the command prompt is "Enter your choice now ->";
	
Instead of typing when the location is not computer room:
	say "There is nothing to type on!".
	
To decide whether operating the computer:
	if the command prompt is "Enter your choice now ->", yes;
	no.
	
After reading a command when operating the computer:
	If the player's command matches "1":
		say "OK.";
		now cargo is pressurized;
	otherwise if the player's command matches "2":
		say "OK.";
		if the small device is on-stage:
			say "Non functional.";
		otherwise:
			now launch time is 4;
			say "4 moves to launch.";
	now the command prompt is ">";
	reject the player's command.
	
Bridge is a room. "The bridge is in shambles! Someone has definitely sabotaged the ship. Are you getting worried yet? One exit leads north." Bridge is south from computer room.
A bent crowbar is in bridge.

There is a room called Lifeboat. The description of lifeboat is "The lifeboat is a little banged-up. Some parts seem to be missing. It is as if you are not wanted to leave!" East from lifeboat is lifeboat bay. South from lifeboat is lifeboat bay. North from lifeboat is lifeboat bay. west from lifeboat is lifeboat bay.
		
There is a room called Lifeboat Bay. The printed name is "Lifeboat Bay". East of lifeboat bay is lifeboat. North of lifeboat bay is passageway a. South of lifeboat bay is passageway b. West of lifeboat bay is nowhere. "Two of the three lifeboats are missing; the last lifeboat is to the east. Two curving passageways exit from here, one north and one south."

Passageway A is a room. The printed name is "Passageway". It is north of hallway. "From here it is possible to go north, south, east, or west. To the south is the cargo bay, which is normally not pressurized." West of passageway A is hallway. East of hallway is nowhere. South of passageway A is Cargo. North of passageway A is Engine room. East of passageway A is Lifeboat bay.

Passageway B is a room. The printed name is "Passageway". It is south of hallway. "One of the many passageways on the ship, from here it is possible to go north, south, east, and west." North of passageway B is Cargo. East of passageway B is lifeboat bay. West of passageway B is hallway. East of hallway is nowhere.

Engines is a room. Engines is north of engine room. "Why did you do that? Was it not obvious that these are the engines? You have consequently incinerated yourself. Are you happy now?

Better luck next time."

When play begins, say "HELP is available.";

Every turn:
	if the player is in engines, end the story;
	if a random chance of 1 in 10 succeeds:
		say "You hear explosions!";
	if the location is the lifeboat:
		if the player carries the small device:
			remove the small device from play;
			say "The small device apparently fits a hole in the instrument board.  With care you insert the device. The lifeboat hums with energy.";
		if launch time is not less than zero:
			say "As you enter, the lifeboat seals and slowly lifts away from the ship. You have made good your escape.";
			end the story finally;
	otherwise if launch time >= 0:
		decrease launch time by 1;
		if launch time is zero:
			end the story saying "The lifeboat has launched without you!";
		say "[launch time] moves to launch.";
		