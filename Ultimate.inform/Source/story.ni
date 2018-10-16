"The Ultimate Text Adventure" by "Erik Ylvisaker"
[
This text adventure is unfinished and doesn't have a good name. I gave up on this when I realized that having lots of rooms in a text adventure isn't actually all that fun.I had fun programming the dog though.
]

Volume 1 - Definitions

Use scoring.

Book 1 - Extensions and Release settings

Release along with interpreter and the introductory booklet.

[Include Player Experience Upgrade (for Glulx only) by Aaron Reed.
Use normal blank lines.]

Include Conversation Package by Eric Eve.
[Include Spellcasting by Jim Aikin. ]

To say /p: say "[paragraph break]".
To say /l: say "[line break]".

Book 2 - Global Definitions

Chapter 1 - Extending basic types

A thing has a text called the text description. The text description is usually "".
A thing has a number called canine-interest. The canine-interest of a thing is usually 0.
A thing can be examined or unexamined. A thing is usually unexamined. After examining a thing: now the noun is examined.
A thing has a number called durability. A thing has a number called initial-durability. The initial-durability of a thing is usually 1000.

A supporter can be uncomfortable or comfortable. Supporters are usually uncomfortable.

A room can be sandy. Rooms usually are not sandy.
A room can be near waves. Rooms are usually not near waves.
A room can be dry, watery, or deep watery. Rooms are usually dry.
	
The empty object is a thing. The empty object is fixed in place.

A person can be good or evil. People are usually good.
A person can be alive or undead. People are usually alive.

A thing has a number called weight.
A thing has a number called max-weight-capacity.

The weight of a thing is usually 1.
The weight of a person is usually 80.
The max-weight-capacity of a person is usually 30.

Check the player taking something:
	let weight-sum be 0;
	repeat with item running through things carried by the player begin;
		now weight-sum is weight-sum + weight of item;
	end repeat;
	if weight-sum plus the weight of the noun is greater than max-weight-capacity of the player, say "You are carrying too much weight. You will have to drop something to take [the noun]." instead.

Check inserting something into something else:
	let weight-sum be 0; 
	repeat with item running through things in the second noun begin;
		now weight-sum is weight-sum + weight of item;
	end repeat;
	if weight-sum plus the weight of the noun is greater than max-weight-capacity of the second noun, say "It won't fit." instead. 


A thing can be bulky. Things are usually not bulky.

Instead of taking a bulky thing while the player carries a bulky thing (called the wrong thing):
	say "[one of]It's going to be difficult to carry [the noun] while also carrying [the wrong thing].[or][The noun] is rather bulky, so it's going to be difficult to carry [regarding the noun][them] while you're holding on to [the wrong thing].[at random]";
	
	
Rule for printing a number of something (called the target) when the listing group size is greater than 7: 
    say "[one of]some [or]various [or]an assortment of [at random]"; 
    carry out the printing the plural name activity with the target.

Chapter 2 - New Types

A dog toy is a kind of thing. The canine-interest of a dog toy is usually 10. The initial-durability of a dog toy is usually 10.

When play begins:
	repeat with toy running through all dog toys:
		now the durability of toy is the initial-durability of toy;
		
A piece of paper is a kind of dog toy. The initial-durability of a piece of paper is usually 2. The canine-interest of a piece of paper is usually 50.

A corpse is a kind of dog toy. A corpse usually has a canine-interest 80. A corpse is usually fixed in place. Understand "carcass", "body", "skeleton", "corpse", "dead body" as a corpse.
A corpse has a thing called detachable part.

Chapter 3 - Actions
	
Understand "step through [something]" as entering. 
Understand "walk through [something]" as entering.
Understand "throw [something] into [something]" as throwing it at.

The other-person response rule is listed after the report stage rule in the specific action-processing rules. 

This is the other-person response rule: 
    follow the observation rules. 

The observation rules is a rulebook. 

Section 1 - Coversation

[		
Interrogating it about is an action applying to two visible things. 
Understand "ask [someone] about [any known thing]" as interrogating it about. 

Understand the commands "show" and "display" and "present" as something new. 

Understand "show [something] to [someone]" or "display [something] to [someone]" or "present [something] to [someone]" as interrogating it about (with nouns reversed). Understand "show [someone] [something]" as interrogating it about. 

Carry out interrogating someone about something:
    say "There is no reply." 
    
Understand "talk to [someone]" as a mistake ("To start a conversation, try to ASK [the noun] ABOUT something or TELL [the noun] ABOUT something."). 
  ]
    
Section 2 - Reading

Understand the command "read" as something new.
Reading is an action applying to one thing.
Understand "read [something]" as reading.

Before reading a thing (called item):
	if the item is not fixed in place and the player does not carry the item:
		say "(First taking [the item].)";
		silently try taking the item.
		
Report reading a thing (called item):
	if the text description of the item is "":
		say "There is no text to read on [the item].";
	otherwise:
		say "[text description of item][/p]".


Section 3 - Sitting

To sit is a verb.
Sitting is an action applying to nothing.
Understand "sit" as sitting.

Report an actor sitting:
	say "[The actor] [sit] down."

Section 4 - Jumping

Jumping over is an action applying to one thing.
Understand "jump over [something]" as jumping over. Understand "jump across [something]" as jumping over.

Jumping into is an action applying to one thing.
Understand "jump into [something]" as jumping into.

Section 5 - Playing

Playing with is an action applying to one thing.
Understand "play with [something]" as playing with.

Instead of playing with something:
	if the noun is a person: 
		say "I'm not sure [the noun] wants to play." ;
	otherwise if the noun is a thing: 
		say "How do you play with that?";
	otherwise: 
		say "I don't understand what you mean.";

Section 6 - Petting

Petting is an action applying to one thing.
Understand "pet [something]" as petting.
Instead of petting something that is not a person:
	say "A living thing might appreciate that more.";
	
Carry out petting a person:
	say "I'm not sure [the noun] would like that.";
	
Section 7 - Throwing

Understand the command "throw" as something new.
Understand "throw [something]" as throwing it at.
Understand "throw [something] at/into [something]" as throwing it at.

The block throwing at rule is not listed in any rulebook.
The futile to throw things at inanimate objects rule is not listed in any rulebook.

The throwing it at action has a thing called the item thrown.
The throwing it at action has an object called the target thrown at.

Rule for supplying a missing second noun when throwing something at:
	now the second noun is the location.

Rule for setting action variables for throwing something at (this is the standard set throwing at rule):
	now the item thrown is the noun;
	now the target thrown at is the second noun;
	
Carry out throwing it at:
	if the target thrown at is a room:
		move the item thrown to the target thrown at.

Check throwing it at:
	if the item thrown is bulky:
		say "[The item thrown] is too heavy to throw." instead.
		
Report throwing it at:
	if the target thrown at is the location:
		say "You throw [the item thrown].";
	else if the target thrown at is a room:
		say "You throw [the item thrown] in the direction of [target thrown at].";
	otherwise:
		say "You throw [the item thrown] at the [target thrown at], but it doesn't seem to do any good."
		
	
Book 3 - Weather

Weather-value is a kind of value. The weather-values are clear, cloudy, light-rain, medium-rain, heavy-rain.

The weather is a weather-value that varies.

A region can be indoors or outdoors. A region is usually indoors.

Definition: a room is outdoors if it is in an outdoors region.
Definition: a room is indoors if it is in an indoors region. 
Definition: a room is wet if it is outdoors and (the weather is light-rain or the weather is medium-rain or the weather is heavy-rain). 

Things have a number called water-threshold. The water-threshold of a thing is usually 25.
Things have a number called water-amount.
Definition: a thing is dry if its water-amount is less than its water-threshold.
Definition: a thing is soaked if its water-amount is greater than its water-threshold.

After examining a thing (called obj): 
	if obj is soaked:
		say "[The obj] is soaked."
		[
Every turn:
	repeat with obj running through people:
		if obj is in a wet room:
			if the weather is light-rain:
				increase water-amount of obj by 5;
			if the weather is medium-rain:
				increase water-amount of obj by 15;
			if the weather is heavy-rain:
				increase water-amount of obj by 30;
		otherwise:
			decrease water-amount of obj by 10;
		if water-amount of obj < 0: 
			now water-amount of obj is 0;
		if water-amount of obj is greater than 100:
			now water-amount of obj is 100;
	]

This is the room description body text with weather rule:
	if the visibility level count is 0:
		if set to abbreviated room descriptions, continue the action;
		if set to sometimes abbreviated	room descriptions and
			abbreviated form allowed is true and
			darkness witnessed is true,
			continue the action;
		begin the printing the description of a dark room activity;
		if handling the printing the description of a dark room activity,
			say "It's too dark to see anything.";
		end the printing the description of a dark room activity;
	otherwise if the visibility ceiling is the location:
		if set to abbreviated room descriptions, continue the action;
		if set to sometimes abbreviated	room descriptions and abbreviated form
			allowed is true and the location is visited, continue the action;
		let R be the location;
		if R is outdoors:
			say "[description of R] [casual weather description][/p]";
		else:
			say "[description of R][/p]".

The room description body text with weather rule is listed instead of the room description body text rule in the carry out looking rulebook.

To say casual weather description:
	if the weather is light-rain:
		choose a random row in table of light rain;
		say "[Text entry]";
	if the weather is medium-rain:
		choose a random row in table of medium rain;
		say "[Text entry]";
	if the weather is heavy-rain:
		choose a random row in table of heavy rain;
		say "[Text entry]".
		
To say weather description:
	choose a row with value of the weather from the table of weather;
	say "[Text entry]"
	
Table of weather
value			Text
clear			"clear skies"
cloudy			"partly cloudy"
light-rain		"lightly raining"
medium-rain		"heavy raining"
heavy-rain		"a torrential downpour"
		
Table of light rain	
Text
"A rather fine rain is falling."
"There is a mild drizzle."
"A fine, misty rain covers everything."

Table of medium rain
Text
"Large raindrops fall from the sky."
"A dreary rain covers the area."

Table of heavy rain
Text
"The rain is coming down very heavily."
"A heavy downpour is soaking everything."


Book 4 - Dogs

Chapter 1 - Definitions

A canine is a kind of animal.
Understand "dog" as a canine.
A canine can be small, medium, or large. Canines are usually medium.
A canine is always bulky.

Affection relates various canines to one person.
The verb to be affectionate towards implies the affection relation.
[Definition: a person is the master to a dog if the dog has the affection relation with the person.]

A canine can be excited, playful, restful, restless, asleep, staying, escaping the rain, freaked. A canine is usually playful.
A canine has a number called boredom. Boredom is usually zero.
A canine has a number called loneliness. Loneliness is usually zero.
A canine has a number called frustration. Frustration is usually zero.
A canine has a thing called forbidden item. The forbidden item of a canine is usually the empty object.
A canine has a thing called interesting item. The interesting item of a canine is usually the empty object.

A canine can be selfish, persuaded, or skipping a turn. A canine is usually selfish.

[Definition: a thing is out-of-reach:
	if it can be seen:
		if it cannot be touched, yes;
	no.]


Chapter 2 - Actions involving a dog

[Make it so that a small dog can be picked up by a person.]
Check taking a person when the noun is not a small canine or the actor is a canine (this is the can't take other people except small canines rule):
	abide by the can't take other people rule.
The can't take other people except small canines rule is listed instead of the can't take other people rule in the check taking rulebook. 

[ Redo this so that drop it only works in conversation (answer it that action?) ]
Dropping an object is an action applying to nothing.
Understand "drop it" as dropping an object.
Carry out a canine (called the dog) dropping an object:
	try the dog dropping a random object carried by the dog.
	
Report a canine (called the dog) dropping a thing (called the object):
	say "[The dog] drops [the object]." instead.
	
Before taking a small canine (called the dog):
	if the dog is affectionate towards the player:
		continue the action;
	otherwise if the the dog is asleep or the dog is restful:
		continue the action;
	otherwise:
		if a random chance of 3 in 10 succeeds:
			say "You manage to collar the dog before it can get away.";
		otherwise:
			say "The dog deftly avoids your grasp.";
			stop the action.

Carry out taking a small canine (called the dog):
	now the dog is skipping a turn;
	
Report taking a small canine (called the dog):
	if the dog is restful:
		say "[The dog] [one of]pulls away reluctantly, but you have no trouble grasping her.[or]is resigned to her fate of being picked up by you.[or]appears indignant that you are interrupting her rest.[at random]";
		stop the action.
	
			
After taking a small canine (called the dog):
	now boredom of the dog is zero;
	if the dog is asleep:
		say "[The dog] wakes up.";
		now the dog is restful;
	continue the action.

Instead of playing with a canine (called the dog):
	if the dog carries a dog toy (called the toy):
		if the durability of the toy is less than 5:
			say "You catch the end of [the toy] and play tug-a-war with [the dog], but the game ends abruptly when [the toy] is ripped apart.";
			remove the toy from play;
		otherwise:
			say "You catch the end of [the toy] and play tug-a-war with [the dog] for a while.";
			decrease the durability of the toy by 4;
		now the dog is skipping a turn;
		if the dog is excited:
			say "[The dog] seems to have calmed down.";
			now the loneliness of the dog is zero;
			now the dog is playful;
		otherwise if the dog is playful:
			say "[The dog] seems to have calmed down.";
			now the dog is restful;
	otherwise if the dog is playful:
		say "You wrestle with [the dog] for a while.";
		say "[The dog] seems tired.";
		now the dog is restful;
	otherwise:
		say "[The dog] doesn't seem to want to play.";
		
Instead of petting a canine (called the dog):
	now the loneliness of the dog is zero;
	say "You pet [the dog] for a while. [if the dog is excited]That seems to calm her down.";
	if the dog is excited, now the dog is playful;
	now the dog is skipping a turn;
		
Before throwing something at:
	if the noun is a canine, say "It'd be really cruel to throw [the noun]." instead;
	if the second noun is a canine, say "We don't condone animal cruelty here." instead.

To say state for (dog - a canine):
	if the dog is excited, say "is very excited";
	if the dog is playful, say "is playful";
	if the dog is restful, say "is resting";
	if the dog is restless, say "appears restless";
	if the dog is asleep, say "is asleep";
	if the dog is staying, say "is staying";
	if the dog is escaping the rain, say "[one of]appears[or]seems[purely at random] to be [one of]miffed[or]upset[or]unhappy[purely at random] about the rain";
	if the dog is freaked, say "is freaked out";
	
Chapter 3 - AI for dogs

Updating state of something is an activity.
Acting intelligently is an action applying to nothing.
Roaming aimlessly is an action applying to nothing.

Globaldog is a canine that varies.

To decide if a (foobar - thing) is out-of-reach of a (dog - canine):
	if the dog can see foobar:
		if the dog can touch foobar, no;
		yes;
	no.

An observation rule for throwing something at in the presence of a playful canine (called the dog): 
	if the forbidden item of the dog is the item thrown, now the forbidden item of the dog is the empty object;
	now the interesting item of the dog is the item thrown;
	say "[The dog] chases after [the interesting item of the dog]!";

Rule for updating state of a canine (called the dog):
	if the dog cannot see the interesting item of the dog and a random chance of 2 in 3 succeeds:
		now the interesting item of the dog is the empty object;
	if the interesting item of the dog is the forbidden item of the dog:
		now the interesting item of the dog is the empty object;
	if the interesting item of the dog is the dog:
		now the interesting item of the dog is the empty object;
	if the interesting item of the dog is the empty object:
		let food be a random edible thing which can be seen by the dog;
		let toy be a random dog toy which can be touched by the dog;
		let toy-alt be a random (dog toy which can be seen by the dog) which can be touched by the dog;
		[say "toy-alt: [toy-alt].";]
		if toy-alt is not nothing and (toy-alt is inside an enterable container or toy-alt is inside an enterable supporter):
			let toy be toy-alt;
		let human be a random (person that is not the dog) that can be seen by the dog;
		[say "human: [list of (people that are not the dog) that can be seen by the dog] -> [human].";
		say "toy: [list of dog toys that can be seen by the dog] -> [toy].";]
		if the dog is carrying a dog toy, let toy be a random dog toy carried by the dog;
		if food is the forbidden item of the dog, let food be the empty object;
		if toy is not the empty object and toy is not nothing, now the interesting item of the dog is toy;
		if human is not the empty object and human is not nothing and a random chance of 1 in 2 succeeds: 
			now the interesting item of the dog is human;
			now the boredom of the dog is zero;
		if food is not the empty object and food is not nothing, now the interesting item of the dog is food;
	let monster be a random evil person that can be seen by the dog;
	if monster is not nothing:
		now the interesting item of the dog is monster;
	if the interesting item of the dog is the dog:
		now the interesting item of the dog is the empty object;
	[say "interesting item: [interesting item of the dog].";]
	if the dog can see a good person that is not the dog:
		if the loneliness of the dog is greater than 6, now the dog is excited;
		if loneliness of the dog is greater than zero, decrease loneliness of the dog by 2;
		if loneliness of the dog is less than zero, now loneliness of the dog is zero;
	otherwise if loneliness of the dog is less than 8:
		increase loneliness of the dog by 1;
	if the dog can see an evil person:
		now the dog is freaked;
	otherwise if the dog is freaked:
		now the dog is restful;
	if the location of the dog is wet:
		now the dog is escaping the rain;
	if the dog is escaping the rain and the location of the dog is not wet:
		if the dog is soaked:
			now the dog is restful;
		otherwise:
			now the dog is playful;
	if the dog is restful:
		if the dog is dry and the dog can see something edible that is not the forbidden item of the dog:
			if a random chance of 1 in 4 succeeds, now the dog is playful;
		if the dog can see the interesting item of the dog:
			if a random chance of 1 in 8 succeeds, now the dog is playful;
	
Carry out a canine (called the dog) acting intelligently:
	if the dog is skipping a turn:
		now the dog is selfish;
		stop the action;
	let the current space be a random room containing the dog;
	let interesting item be the interesting item of the dog;
	if the dog is carrying something edible:
		try the dog eating a random edible thing carried by the dog;
		stop the action;
	if the dog is freaked:
		if the dog can see an evil person:
			if the interesting item is an evil person:
				if the dog is visible, say "[The dog] [one of]growls [one of]menacingly[or]fearfully[or]cautiously[or]viciously[purely at random][or]stares cautiously[or]barks [one of]menacingly[or]fearfully[or]rapidly[or]viciously[purely at random][purely at random] at [the interesting item].";
			otherwise:
				try the dog roaming aimlessly;
		otherwise:
			try the dog roaming aimlessly;
		stop the action;		
	if the dog is affectionate towards someone (called the master) and the location of the dog is not the location of the master: 
		let the way be the best route from the location of the dog to the location of the master, using doors;
		let target room be the room the way from the location of the dog;
		if target room is desireable:
			try the dog going the way;
			stop the action;
	if the dog is escaping the rain:
		try the dog roaming aimlessly;
	if the dog is asleep:
		increase boredom of the dog by 1;
		if boredom of the dog is greater than 15:
			now the dog is playful;
			if the dog is visible, say "[The dog] wakes up.";
	if the dog is restful:
		if the dog is carried by a person (called human):
			increase boredom of the dog by 1;
			if boredom of the dog is greater than 4:
				now the dog is playful;
		otherwise if the dog is not on a supporter and the dog can see a comfortable enterable supporter:
			let bed be a random comfortable enterable supporter in the current space;
			try the dog entering the bed; 
		otherwise:
			if the dog is carrying a dog toy (called the toy):
				if the dog is visible, say "[The dog] softly chews on [the toy].";
				if the durability of the toy is greater than 1, decrease the durability of the toy by 1;
			increase boredom of the dog by 1;
			if boredom of the dog is greater than 3:
				if the dog is carrying a dog toy (called the toy):
					silently try the dog dropping the toy;
				now the dog is asleep;
				if the dog is visible:
					say "[The dog] [one of]goes to sleep[or]dozes off[purely at random].";
	if the dog is excited:
		if the dog is visible:
			if the dog is carried by the player:
				say "[The dog] [one of]licks your face[or]snuggles in your arms[purely at random].";
			otherwise if a random chance of 1 in 3 succeeds and the dog is small:
				say "[The dog] is so excited to see you, [regarding the dog][they] jumps right into your arms.";
				if the player carries something bulky:
					let heavy item be a random bulky thing carried by the player;
					say "Unfortunately, you are unable to catch her since you are carrying [the heavy item]. [The dog] unceremoniously drops to the ground.";
				otherwise:
					now the player carries the dog;
			otherwise:				
				say "[one of][The dog] greets you happily with her tail wagging vigorously, apparently very excited to see you.[purely at random]";
			if the loneliness of the dog is less than 3, now the dog is playful;
			stop the action;
	if the dog is playful:
		if the dog is carried by the player:
			if a random chance of 1 in 4 succeeds:
				say "[The dog] wriggles free of your grasp.";
				silently try dropping the dog;
			otherwise if a random chance of 2 in 3 succeeds:
				say "[The dog] struggles against your hold.";
		else if the dog is in a vehicle:
			if a random chance of 1 in 4 succeeds:
				say "[one of][The dog] whines, staring wistfully out of [the holder of the dog].[or][The dog] shifts around, obviously uncomfortable at being confined within [the holder of the dog].[at random]";
		else if the dog is on a supporter (called the bed) and the interesting item is not on the bed:
			try the dog getting off the bed;
		else if the dog is in a container (called the box) and the interesting item is not in the box:
			try the dog getting off the box;
		else if the dog carries the interesting item:
			if a random chance of (boredom of the dog) * 10 in (40 + canine-interest of the interesting item) succeeds:
				try the dog dropping the interesting item;
				now the forbidden item of the dog is the interesting item;
				now boredom of the dog is zero;
				now the interesting item of the dog is the empty object;
			otherwise:
				decrease the durability of the interesting item by 3;
				if the dog is visible:
					if the durability of interesting item is less than 1:
						say "[The dog] [one of]shreds [the interesting item] to little pieces.[or]destroys [the interesting item].[purely at random]";
					otherwise:
						say "[The dog] [one of]happily chews on [the interesting item][or]gnaws at [the interesting item][or]licks the surface of [the interesting item][at random].";
				increase boredom of the dog by 1;
				if the durability of the interesting item is less than 1, remove the interesting item from play;
		else if the interesting item is a person and the dog can see the interesting item:
			let item-name be the printed name of interesting item;
			if the interesting item is the player, let item-name be "you";
			if the interesting item is on a supporter (called the bed) and the bed does not contain the dog:
				try the dog entering the bed;
			else if the interesting item is in a container (called the box) and the box does not contain the dog:
				try the dog entering the box;
			else if the dog carries something:
				try the dog dropping a random thing carried by the dog;
			else if the dog is visible:
				if the dog is affectionate towards the interesting item:
					let handle be a random object carried by the dog;
					if handle is not nothing and the dog can touch the interesting item:
						if the boredom of the dog is greater than 2:
							silently try the dog dropping the handle;
							say "[The dog] drops [the handle] at [regarding the interesting item][possessive] feet and looks up at [them]. Apparently [regarding the dog][they] wants [one of]to play[or]wants [regarding the interesting item][they] to play with [regarding the dog][them][purely at random].";
						otherwise:
							increment the boredom of the dog;
							say "[The dog] grows playfully. It looks like [regarding the dog][they] wants to play keep-away with [the handle].";
					otherwise if the handle is nothing and a random chance of 1 in 2 succeeds and the dog can touch a dog toy:
						try the dog taking a random dog toy that can be touched by the dog;
					otherwise if the interesting item is inside a comfortable enterable supporter:
						increment the boredom of the dog;
						try the dog entering a random supporter containing the interesting item;
					otherwise:
						increment the boredom of the dog;
						say "[The dog] [one of]playfully nips at [regarding the interesting item][possessive] heels[or]growls playfully[at random].";
				otherwise if the interesting item carries something edible (called food) and the dog can see the food:
					increment the boredom of the dog;
					say "[The dog] looks at [regarding the interesting item][possessive] [food].";
					now the interesting item of the dog is the food;
				otherwise:
					increment the boredom of the dog;
					say "[The dog] barks at [item-name].";
					now the interesting item of the dog is the empty object;
			otherwise:
				increment the boredom of the dog;
			if the boredom of the dog is greater than 4 or a random chance of 1 in 5 succeeds:
				now the forbidden item of the dog is the interesting item;
				now the boredom of the dog is zero;
		else if the dog can see the interesting item:
			if the the interesting item is portable and the dog can touch the interesting item:
				try the dog taking the interesting item;
			otherwise if the dog cannot touch the interesting item:
				increase boredom of the dog by 1;
				if boredom of the dog is greater than 3:
					now the forbidden item of the dog is the interesting item;
					if the dog is visible, say "[The dog] apparently gives up on getting [the interesting item].";
					now the boredom of the dog is 0;
				otherwise if the boredom of the dog is greater than 1 and the interesting item is not edible:
					now the forbidden item of the dog is the interesting item; 
					now the boredom of the dog is 0;
					if the dog is visible, say "[The dog] looks around, apparently bored.";
				otherwise if the interesting item is carried by the player and the dog is visible:
					say "[The dog] stares intently at you, waiting for you to give her [the interesting item].";
				otherwise if the boredom of the dog is 3:
					if the dog is visible, say "[The dog] gives a bark, hoping that you will offer [them] [the interesting item].";
				otherwise if the boredom of the dog is 2:
					if the dog is visible, say "[The dog] stares wistfully at [the interesting item], giving a small whimper.";
				otherwise if the interesting item is in an enterable container or the interesting item is in an enterable supporter:
					if the dog is visible, say "[The dog] sniffs in the direction of [the holder of interesting item]. ";
					try the dog entering the holder of the interesting item;
				otherwise if the interesting item is in a container or the interesting item is on a supporter:
					if the dog is visible, say "[The dog] sniffs in the direction of [the holder of interesting item].";						
			otherwise if the dog carries something:
				try the dog dropping a random thing carried by the dog;
			otherwise: [ the interesting item is not portable, so let the dog gnaw on it ]
				if the dog is visible:
					say "[The dog] [one of]grabs onto [the interesting item] and begins tugging[or]tugs at [the interesting item][or]growls as [they] [pull] at [the interesting item][or]gnaws on [the interesting item][at random].";
				increment the boredom of the dog;
				if the interesting item is a corpse:
					let part be the detachable part of the interesting item;
					if a random chance of 1 in 3 succeeds and the part is off-stage:
						now the dog carries the part;
						now the interesting item of the dog is a random thing carried by the dog;
						now the durability of the part is the initial-durability of the part;
						now the boredom of the dog is zero;
						if the dog is visible:
							say "[The dog] manages to pull off [a part]!";
		else if the dog is visible:
			if a random chance of 1 in 6 succeeds and the current space is near waves:
				say "[The dog] barks at the incoming waves.";
			otherwise if a random chance of 1 in 4 succeeds:
				if the current space is sandy and a random chance of 1 in 3 succeeds:
					say "[The dog] digs playfully in the sand.";
				otherwise if the current space is watery and a random chance of 1 in 3 succeeds:
					say "[The dog] splashes in the water.";
				otherwise:
					say "[The dog] stretches.";
		else if the boredom of the dog is 5:
			now the dog is restful;
		else:
			increase the boredom of the dog by 1;
			try the dog roaming aimlessly;

To say possessive of a person:
	if the person is the player:
		say "your";
	otherwise:
		say "[the noun]'s";
		
Carry out a canine (called the dog) roaming aimlessly:
	if the canine is on a supporter (called the bed):
		try the dog getting off the bed;
		stop the action;
	if the canine is in a container (called the box):
		try the dog getting off the box;
		stop the action;
	if the canine is not held by a person:
		let the current space be a random room containing the dog;
		let direct be nothing;
		[say "[current space]";]
		let B be the canine-desirability of the current space;
		if the current space is wet, let B be B - 10;
		let B be B - (boredom of the dog) * 10;
		[say "[B][line break]";]
		repeat with newdir running through directions:
			let the space be the room newdir from the current space;
			if the space is not nothing:
				let A be the canine-desirability of the space;
				[say "[newdir] - [the space] - [A][line break]";]
				if A > B:
					let direct be newdir;
					let B be A;
				if A is B and a random chance of 1 in 2 succeeds:
					let direct be newdir;
					let B be A;
		[say "[direct]";]
		if direct is not nothing:
			try the dog going direct;
		otherwise if the dog is playful:
			increase boredom of the dog by 1;
		otherwise if the dog is excited:
			increase boredom of the dog by 2;
			
To decide what number is the canine-desirability of (space - a room):
	let z be 0;
	if the space is outdoors:
		if the space is wet:
			let z be z - 50;
		otherwise:
			let z be z + 30;
	repeat with item running through things in space:
		if item is not the forbidden item of globaldog:
			let z be z + canine-interest of item;
		if globaldog is affectionate towards item:
			let z be z + 50;
		if item is an evil person:
			let z be z - 100;
	decide on z.

Definition: a room is desireable if the canine-desirability of it is greater than 0.
	
After a canine (called the dog) going:
	now the boredom of the dog is 0;
	continue the action.
	
Before a canine (called the dog) taking something (this is the dogs can only carry one thing rule):
	if the dog carries something:
		try the dog dropping a random thing carried by the dog.
		
After a canine (called the dog) taking something:
	now the interesting item of the dog is empty object;
	continue the action.
	
After a canine (called the dog) dropping something (called the toy):
	now the forbidden item of the dog is the toy;
	continue the action.
	
Check taking something in the presence of a canine (called the dog) (this is the playful dogs want to take an object you want before you can get to it rule):
	if the dog is in a vehicle, continue the action;
	if the noun is not carried by the dog:
		if the interesting item of the dog is the noun or the interesting item of the dog is the player:
			if a random chance of 1 in 2 succeeds:
				silently try the dog taking the noun;
				if the dog carries the noun:
					now the dog is skipping a turn;
					now boredom of the dog is zero;
					say "As you reach for [the noun], [the dog] leaps in quickly and grabs it first." instead;
				
Check taking something held by a playful canine (called the dog) (this is the playful dogs want to play keep away with objects they carry rule):
	if a random chance of 2 in 3 succeeds:
		now the boredom of the dog is zero;
		say "You try to take [the noun] from [the dog], but [regarding the dog][they] leaps away at the last second." instead;
	otherwise if a random chance of 1 in 2 succeeds:
		now the boredom of the dog is zero;
		if the durability of the noun is less than 2:
			say "You manage to grab [the noun], but [the dog] pulls it away and it breaks!";
			remove the noun from play instead;
		otherwise:
			say "You manage to lay a hand on [the noun], but [the dog] pulls it away from you!";
			decrease the durability of the noun by 2;
			stop the action;
	[otherwise:
		ignore the can't take people's possessions rule;]
	
Report taking something held by a playful canine (called the dog):
	say "You manage to take [the noun] away from [the dog].";
	
Every turn:
	repeat with dog running through canines:
		let globaldog be dog;
		if dog is on-stage:
			carry out the updating state activity with dog;
			try dog acting intelligently;

Chapter 4 - Rules for dogs

Section 1 - Touching rules

A rule for reaching inside a supporter (this is the dogs can't reach inside supporters rule):
	If the person reaching is a canine (called the actor) and the supporter in question does not enclose the actor:
		deny access.

A rule for reaching outside a supporter (this is the dogs can't reach outside supporters rule):
	If the person reaching is a canine:
		deny access.
		
A rule for reaching inside a container (this is the dogs can't reach inside containers rule):
	If the person reaching is a canine (called the actor) and the container in question does not enclose the actor:
		deny access.

A rule for reaching outside a container (this is the dogs can't reach outside containers rule):
	If the person reaching is a canine:
		deny access.

A rule for reaching inside a person (this is the dogs can't take things from people rule):
	If the person reaching is a canine:
		deny access.

A rule for reaching outside a person (this is the dogs can't take things when held rule):
	If the person reaching is a canine:
		deny access.

Section 2 - Instead rules
		
Instead of a canine (called a dog) opening a door (called the portal):
	if the dog is visible:
		say "[The dog] [one of]scratches at [the portal].[or]barks at [the portal], clearly hoping someone will be kind enough to open it.[purely at random]";
	else if the portal is visible:
		say "You hear [one of]scratches at [the portal].[or]barking coming from beyond [the portal].[at random]".

Section 3 - Check rules

Check a canine (called the dog) taking a bulky thing:
	rule fails;
	
Section 4 - Reporting rules

Report a canine (called a dog) entering a supporter (called the bed):
	say "[The dog] [one of]gingerly [or]deftly [or][purely at random][one of]hops[or]jumps[or]climbs[purely at random] onto [the bed]." instead.

Report a canine (called a dog) getting off a supporter (called the bed):
	say "[The dog] [one of]gingerly [or]deftly [or][purely at random][one of]hops[or]jumps[or]climbs[purely at random] off  [the bed]." instead.
	
Report a canine (called a dog) entering a container (called the box):
	say "[The dog] [one of]gingerly [or]deftly [or][purely at random][one of]hops[or]jumps[or]climbs[purely at random] into [the box]." instead.

Report a canine (called a dog) getting off a container (called the box):
	say "[The dog] [one of]gingerly [or]deftly [or][purely at random][one of]hops[or]jumps[or]climbs[purely at random] out of [the box]." instead.

	
Section 5 - Giving things to dogs

Response of a canine (called dog) when given something:
	if the noun is bulky:
		say "[The noun] is much too big for [the dog] to carry.";
	else if the dog carries something:
		say "[The dog] is already carrying [the random thing carried by the dog] in [their] mouth.";
	else if the noun interests the dog:
		move the noun to the dog;
		now the dog is skipping a turn;
		if the noun is edible, now the frustration of the dog is zero;
		say "You give [the noun] to [the dog].";
	else:
		say "[The dog] is uninterested in [the noun]."
		

To decide whether (item - a thing) interests (dog - a canine):
	if the dog has the item, no;
	if the item is edible, yes;
	if the dog is interested in the item, yes;
	no. 

To decide if (the dog - canine) is interested in (the toy - thing):
	if the toy is a person, decide no;
	if the toy is edible and the toy is not the forbidden item of the dog, decide yes;
	if the toy is the interesting item of the dog, decide yes;
	if the canine-interest of the toy is greater than zero, decide yes;
	decide no.

	
Chapter 5 - Persuasion for dogs

Persuasion rule for asking a canine (called the dog) to try dropping something:
	now the dog is persuaded;
	persuasion succeeds;
	
Persuasion rule for asking a canine (called the dog) to try dropping an object:
	now the dog is persuaded;
	persuasion succeeds;

Persuasion rule for asking a canine (called the dog) to try taking something:
	if the dog carries the noun:
		say "[The dog] looks at you quizzically, possibly because it doesn't understand how to pick up something it is already carrying.";
		persuasion fails;
	if the dog is the noun:
		say "[The dog] looks at you quizzically.";
		persuasion fails;
		
Persuasion rule for asking a canine (called the dog) to try doing something:
	if the dog is not proper-named:
		say "[The dog] doesn't seem to understand your command. Perhaps you need to learn her name somehow?";
		persuasion fails;
	if the player carries something edible:
		if frustration of the dog is greater than 1 and a random chance of frustration of the dog in 5 succeeds:
			say "[The dog] just barks at you, clearly frustrated that you have asked her to perform so many commands without giving her any rewards.";
			persuasion fails;
		otherwise:
			increment frustration of the dog;
			now the dog is persuaded;
			persuasion succeeds;
	if the dog is affectionate towards the player and a random chance of 1 in 2 succeeds:
		now the dog is persuaded;
		persuasion succeeds;

After asking a canine (called the dog) to try doing something:
	now the boredom of the dog is zero;
	continue the action.
	
After someone doing something when the person asked is a canine:
	if the person asked is persuaded:
		now the person asked is skipping a turn;
	continue the action.
		
Book 5 - Help system

Table of Help Topics
name (indexed text)	content
"topics"			"[help topics]"
"introduction"	"You can issue commands to the game by starting with a verb. For instance, typing EXAMINE THE DOOHICKEY will cause the game to report the results of such an examination. (You needn't type in uppercase, but I will use uppercase to distinguish the commands you may type in.) [if the location is under the stairs]You may wish to try this now by typing EXAMINE SHELVES.[otherwise]You may wish to try this now by typing EXAMINE [random thing in the location].[end if] [/p]Other useful commands are SEARCH (something), TAKE (an object), DROP (something you are carrying). Typing LOOK by itself will give you a description of the area you are currently in. A good strategy is to type LOOK to get the area description, and then use EXAMINE on the nouns that you see in the description. Many verbs have synonyms, for example you can type LOOK AT (something) instead of EXAMINE (something). Also, some commonly used verbs can be abbreviated, for examine EXAMINE SHELVES can be abbreviated with X SHELVES. [/p][sample movement]Finally, you can type INVENTORY or just I to get a list of items that you are carrying. Also, if you want to repeat the last command, you can type AGAIN or just G. [/p][help topics]"
"objects"		"There are various ways to interact with the objects you might find. [/p]EXAMINE (the object) - This gives a cursory examination of the object in question, giving a description of what it is, what it looks like, and possibly what it smells or feels like. [/l]SEARCH (the object) - Some things are hidden and it will take more than a cursory examination to find something concealed. [if the location is under the stairs]You might try to SEARCH SHELVES to see what you can find. [end if]This command will perform a detailed search for anything that is hidden or concealed. [/l]TAKE (object) - This command will pick up an object so that you can carry it with you as you move around. Obviously, some things will be too heavy to take. [/l]DROP (object) - This command will put down something that you are carrying so it no longer weighs you down. [/l]TURN ON (object) - Some objects are devices which can be switched on or off. If something can be turned on, it can also be turned off. [/l]OPEN (object) - Some objects are containers. This is usually obvious from the name or description of the object. Once a container is opened, you can LOOK INSIDE (the container) if you need a reminder of what is inside. Generally, things which can be opened can also be closed. You can also use this command to open doors. [/p]You can issue more complicated commands using multiple nouns with things like PUT BREAD IN THE TOASTER."
"conversation"	"To start a conversation with someone, type the command SAY HELLO TO (the person). You can just SAY HELLO if there is only one person around to talk to. When you are done, you can SAY GOODBYE. The conversation parsing is very simple, so things like 'ask the wizard if he knows where my grandfather is' are much too complicated. Instead there are some basic commands to create the flow of conversation. [/p]TOPICS - This will give a list of suggestions of things you can ask the person you're talking to about. These are usually just the most pressing topics, so most of the time, you can ask about a variety of other things as well. [/l]ASK (person) ABOUT (topic) - This will ask a person to tell you about a particular topic. You can omit the person if you are already in a conversation with someone. A good way to get started in conversation is ASK ABOUT GRANDFATHER. This command can be abbreviated as A (topic), e.g. A GRANDFATHER. [/l]TELL (person) ABOUT (topic) - This is slightly different then asking someone about something, instead you are telling them what you know about a particular topic. This can be abbreviated with T (topic). [/l]SHOW (object) TO (person) - You can show an object to a particular person to initiate conversation about that object. You can just type SHOW (object) if you are already in a conversation. [/l]GIVE (object) TO (person) - If you have something that the other person wants, you can offer to give it to them with this command. [/p]If another character asks you a question, you can usually respond by typing YES or NO. If you are unsure of how to respond, you might see if typing TOPICS gives you any reminder of what you might want to say. [/p]You can issue commands to other characters by typing their name first, followed by a comma and then the command. For example, FISHERMAN, GO WEST. The other character may or may not be inclined to obey you however!"
"saving"			"You can save your game to resume later by typing SAVE. Next time you start the game up, you can reload your saved game by typing RESTORE."

read-introduction is a truth state that varies.
help-message is a truth state that varies.

Before reading a command when help-message is false:
	say "[as help system]You can type HELP anytime to get help.[as normal]";
	now help-message is true;
	
After reading a command (this is the parse for help rule):
	if the player's command matches the regular expression "^help":
		let the_topic be word number two in the player's command;
		if the_topic is empty:
			if read-introduction is false, now the_topic is "introduction";
			otherwise now the_topic is "topics";
		if the_topic is "introduction", now read-introduction is true;
		say "[as help system]";
		unless there is a content corresponding to a name of the_topic in Table of Help Topics:
			say "There is no help available for '[the_topic]'. [/p]";
			now the_topic is "topics";
		say the content corresponding to a name of the_topic in Table of Help Topics;
		say "[as normal][/l]";
		reject the player's command.

To say as help system:
	say "[italic type][run paragraph on]";
To say as normal:
	say "[roman type][run paragraph on]";
	
To say sample movement:
	let sel-direction be nothing;
	repeat with dir running through directions:
		if the room dir from the location is a room:
			now sel-direction is dir;
	if sel-direction is nothing:
		say "You are not currently in a room with exits, but when you are you can move about with a command like GO SOUTH, SOUTH, or just S. Other directions can be abbreviated as well with a command like NW for northwest, etc.";
	otherwise:
		say "You can move about with a command like GO [sel-direction], [sel-direction] or just [abbreviation for sel-direction].";
	say "[/l]";
		
To say abbreviation for (dir - direction):
	if dir is:
		-- north: say "N";
		-- south: say "S";
		-- west: say "W";
		-- east: say "E";
		-- southwest: say "SW";
		-- southeast: say "SE";
		-- northwest: say "NW";
		-- northeast: say "NE";
		-- up: say "U";
		-- down: say "D";
		-- inside: say "IN";
		-- outside: say "OUT";
		
To say help topics:
	say "To get help on a specific topic, type HELP (topic). The following help topics are supported: [/l]";
	repeat through the Table of Help Topics:
		if name entry is not "topics":
			say "    HELP [name entry] [/l]";
		
		[
A help topic is a kind of thing. A help topic is always privately-named.
Getting help is an action applying to one thing.


Rule for supplying a missing noun when getting help:
	now the noun is help-introduction.
	
First before getting help:
	say "[description of the noun]" instead.
		
To say introductory help statement:
	say "To move about, try saying north.";

	
First check getting help:
	ignore the basic accessibility rule.
	
Help-Introduction is a help topic. The printed name is "introduction". The description is "To move about, try saying north."
Help-Conversation is a help topic. The printed name is "conversation". The description is "To start a conversation with someone, type the command SAY HELLO TO (the person)."
]

Volume 2 - Important Items and People

Book 1 - Items

Part 1 - Definitions

Things can be mundane or magical. A thing is usually mundane.

Part 2 - Item Descriptions
	
Chapter 1 - Magical Items

Section 1 - Crown and Scepter

The jeweled crown is a magical wearable thing. The description is "It's a beautiful gold crown, encrusted with a variety of valuable gemstones. You feel very wealthy just holding it." The weight is 2.

The scepter is a magical thing. The description is "The scepter is beautifully crafted, made out of gold. Several strange symbols are etched into the head of the scepter." The weight is 5.

Section 2 - Power Bracelet
 
The power bracelet is a magical wearable thing. "The mermaid is wearing a bracelet." The description is "The bracelet is rather plain, aside from the adornment of a handful of strange characters you don't recognize."
Report wearing the power bracelet:
	say "You put on [the power bracelet]. You feel a surge of magical energy flow through your body! It's as though you could lift anything!" instead.
Carry out wearing the power bracelet:
	now the max-weight-capacity of the player is 60.
Carry out taking off the power bracelet:
	now the max-weight-capacity of the player is 30.

Section 3 - Spheres
	
The blue crystal sphere is a magical thing. "There is some sort of marble in the sand here." The description is "It's a small blue sphere, the size of a marble. Inside you see some strange mist..." Understand "marble" as the blue crystal sphere. The weight is 0.
The mist in the sphere is part of the blue crystal sphere. The description is "The mist in the blue crystal sphere is mesmerizing. It reminds you of the mist in the mirror in your grandfather's house."


A mermaid scale is a magical dog toy. The canine-interest of a mermaid scale is 50. The initial-durability of a mermaid scale is 25. The weight is 0.

The wand of weather-changing is a magical thing. The weight is 1.
The wand of weather-changing can be positive polarity or negative polarity.

Instead of waving the wand of weather-changing:
	if the weather is heavy-rain and the wand of weather-changing is positive polarity:
		now the wand of weather-changing is negative polarity;
	if the weather is clear and the wand of weather-changing is negative polarity:
		now the wand of weather-changing is positive polarity;
	[if the wand of weather-changing is positive polarity:	
		increment the weather;
	otherwise:
		decrement the weather;]
	say "It is now [weather description].[/p]".
	

Section 4 - Others

The power symbol is a magical thing. The description is "You run your fingers over the symbol the lich burned into your arm. The symbol faintly pulses with energy." The weight is 0.


Chapter 2 - Journal Pages

Journal page is a kind of a piece of paper. The description of a journal page is usually "It appears to be a page out of someone's journal. The handwriting is clearly hastily written, but it is legible. It appears to have been chewed on." Understand "paper" or "piece of paper" as a journal page. The weight of a journal page is usually 1.

journal page 1 is a journal page. The text description is "The text reads:

[bold type]April 2nd[roman type]
That mirror I bought at the antique shop has somehow changed. For some reason it no longer reflects anything. Ugh, I'm going to stick it in the storage space until I can decide what to do with it, once I get back after my trip to Europe.

[bold type]May 14th[roman type]
I can't believe I forgot to take my journal to Europe. I picked up a bunch of interesting antiques while I was there. I will write more about it later, right now I have to store them.

[bold type]May 15th[roman type]
I've made an amazing discovery! The mirror I bought is a portal of some kind. It seems to respond to some sort of special stone I bought in Ireland. I've just gone through it and back again. What a rush! It was pitch black and I could barely see with my little pen flashlight but I'm going to get a lantern and some tools and go to explore." 


journal page 2 is a journal page. The text description is "The text reads:

[bold type]May 18th[roman type]
The mirror seems to have transported me to a remote location on another world. I've seen some amazing things here! I don't think this is anywhere on earth. There are two moons! I've found a small abandoned shack and have added some furnishings to it. Perhaps I will finally get the dog I always wanted!"

journal page 3 is a journal page. The text description is "The text reads:

[bold type]May 21st[roman type]
I have begun to do some exploring around the area. There is a stream leading to the ocean a ways to the west. The stream comes from a waterfall in the woods, and some sort of mausoleum exists in the woods to the east.

[bold type]May 24th[roman type]
I got a dog today! I have named her Atari. Since I have no backyard in my condo I have brought her to this other world where she can run around in the large field and play. Ah, this is the life."

After reading journal page 3:
	carry out the learning Atari's name activity;
	continue the action.
	
journal page 4 is a journal page. The text description is "This page has been ripped and heavily chewed on. Only a few words are legible:

[bold type]May 26th[roman type]
That damn dog! It seems ...
to chew on my ...
to rip out several pages ...
severe damage the bind...
more careful about...

The rest of the page is missing."

journal page 5 is a journal page. The text description is "The text reads:

[bold type]June 2nd[roman type]
I have managed to train Atari in a few things. I have to say her name each time I want to give her a command. Saying something like 'Atari, get on the bed' seems to work well. She only seems to be obedient when I am holding some food however."

After reading journal page 5:
	carry out the learning Atari's name activity;
	continue the action.
	
Chapter 3 - Advanced Technology

Section 1 - Basic things

The raincoat is wearable. The description is "It's a raincoat, made from durable PVC, colored bright yellow for safety on those rainy nights with low visibility. It comes with a hood, but it is not detachable on this model. It's extra long, to keep you legs dry. It will keep you extra dry on those long stormy nights." The weight is 5.

The air pump is a thing. The description is "It's a quick action hand-pump, designed for quick inflation of air mattresses, inner tubes and all manner of inflatable things." The weight is 4.

The brass lantern is a device. The description is "It's a lantern made out of brass. It is probably battery powered. There is something oddly familiar about it." Understand "lamp" as the lantern. The weight is 3.
The brass lantern is switched off and unlit.
After switching on the lantern:
	now the lantern is lit;
	continue the action. 
After switching off the lantern:
	now the lantern is unlit;
	continue the action.
Instead of dropping the lantern when in darkness:
	say "Something tells you that it is unwise to drop your lantern when you can't see anything."
Before switching off the lantern when the player does not have the lantern:
	say "(First taking [the lantern].)";
	silently try taking the lantern.
Check switching off the lantern when the player does not have the lantern:
	say "You should pick up [the lantern] first." instead.


Section 2 - Kayak

The inflatable kayak is a portable bulky vehicle. The description is "The kayak is a sturdy inflatable model, designed to carry one person. It is compact enough to take along on any adventure, and it sets up quickly. It has quick release valves for quick deflation, and drain valves on the bottom for emptying it after taking it out. The seat is removable and has adjustable back support for all-day comfort on the water. And it even comes with a convenient carrying case. It is currently [if kayak is inflated]inflated[otherwise]deflated[end if]." The kayak can be inflated or deflated. The kayak is deflated. The weight is 20.

Rule for printing a locale paragraph about the kayak:
	if the player is not in the kayak:
		if the location is watery and the kayak is inflated:
			say "There is [an inflatable kayak] beached here[if the kayak contains anything]. Inside is [list of things contained by the kayak with indefinite articles][end if].";
		otherwise if the kayak is inflated:
			say "Oddly, someone seems to have inflated [an inflatable kayak] and then left it here, even though there is no water around[if the kayak contains anything]. Inside is [list of things contained by the kayak with indefinite articles][end if].";
		otherwise:
			say "There is [an inflatable kayak] here, but it is not inflated.";
	continue the activity.
	
Rule for listing nondescript items of the kayak when the player is in the kayak: do nothing. 

Rule for deciding whether all includes the inflatable kayak:
	if the player is in the kayak:
		it does not;
	otherwise:
		it does.
	
Check taking the kayak when the player is in the kayak (this is the can't take the kayak if you're in it rule):
	say "You can't take the kayak when you're in it!";
Check taking the inflated kayak (this is the can't carry an inflated kayak rule):
	say "It's much too large to carry around when inflated." instead.

Inflating is an action applying to two visible things.
Understand "inflate [something]" as inflating.
Understand "inflate [something] with [something]" as inflating. 
Understand "inflate [something] with breath/breathe/lungs" as a mistake ("It's going to take much too long to do that. You'd better look for a pump.").

Rule for supplying a missing noun while inflating:
	if the inflatable kayak is visible and the inflatable kayak is deflated:
		say "(the inflatable kayak)";
		now the noun is the inflatable kayak;
	otherwise:
		say "What do you want to inflate?";
Rule for supplying a missing second noun while inflating something:
	if the air pump is visible:
		say "(with [the air pump])";
		now the second noun is the air pump;
	otherwise:
		say "What do you want to inflate [the noun] with?"
	
Deflating is an action applying to one visible thing.
Understand "deflate [something]" as deflating.

Rule for supplying a missing noun while deflating:
	if the inflatable kayak is visible and the inflatable kayak is inflated, now the noun is the inflatable kayak;
	otherwise say "What do you want to deflate?"
	
Check entering a deflated kayak (this is the can't enter a deflated kayak rule):
	say "You should probably inflate it first." instead.
Instead of exiting when the player is in a kayak and the location is deep watery (this is the can't get out of a kayak if there is no land rule):
	say "It's embarassing to admit it, but you're actually not such a great swimmer. You're better off getting out near land."

Instead of inflating something:
	say "I don't think [the noun] is inflatable."
	
Instead of inflating a person:
	say "That might make [the noun] really mad."
	
Instead of inflating an animal:
	say "I'm not sure what universe you live in, but in this one, animals are not inflatable."

Instead of inflating the inflated kayak:
	say "[The kayak] is already inflated.";
Instead of deflating the deflated kayak:
	say "[The kayak] is already deflated.";
	
Instead of inflating the deflated kayak:
	if the player carries the kayak:
		say "(first dropping the kayak)";
		silently try dropping the kayak;
	say "You pump and pump and eventually you have a fully inflated kayak.";
	now the kayak is inflated.
	
Instead of deflating the inflated kayak:
	if the player is in the kayak:
		say "You really ought to get out of the kayak before trying to deflate it.";
	otherwise:
		say "You open the valves and with a hiss, the air rushes out of the kayak. It actually deflates remarkably fast.";
		now the kayak is deflated;
		now all things contained in the kayak are in the location;
	
Check going when the player is in the kayak (this is the can we paddle in the kayak rule):
	if the player does not carry the oar:
		if the player can see the oar:
			say "(first taking the oar)";
			silently try taking the oar;
	if the player does not carry the oar:		
		say "You splash in the water a bit, but without an oar you're not going anywhere." instead;
	if the room gone to is dry:
		say "You're going to have to get out of the kayak and walk if you want to go that way." instead.

After going somewhere by kayak:
	say "[one of]SPLASH, SPLASH! You paddle your kayak with the oar.[or][or][at random]";
	continue the action.
	
Chapter 4 - Other important items

A wooden oar is a bulky thing. "There is a wooden oar lying in the sand here, underneath where the canoe used to be." The description is "The wooden oar actually appears to be in good shape[if we have examined the canoe], and not plagued by the rot and termites that have attacked the canoe that was covering it[end if].". The weight is 10.

Book 2 - Quests

A quest is a kind of thing.

The no-quest is a quest.
The wizard-quest is a quest.
The lich-quest is a quest.
The tyrant-quest is a quest.

The chosen quest is a quest that varies.
The chosen quest is no-quest.

Book 3 - Actors

Part 1 - Dogs

Chapter 1 - Atari

Atari is a female canine. The description of Atari is "She's a little brown dog, with some white markings on her feet and neck that gives the appearance that she's wearing socks and a handkerchief. She is wearing a black collar. [If Atari is carrying something]She is carrying [list of objects carried by Atari with indefinite articles]. [end if]She [state for Atari].". The printed name of Atari is "small brown dog". Atari is not proper-named. Atari is small. The black collar is a part of Atari. The description of the black collar is "It's a black dog collar. Hanging from the hook on the collar is a small tag which reads 'Atari.'"  The weight of Atari is 5. The max-weight-capacity of Atari is 8.

Learning Atari's Name is an activity.
Rule for learning atari's name:
	now the printed name of Atari is "Atari";
	now Atari is proper-named;
	
Before reading the black collar, try examining the black collar instead.

After giving something edible to Atari (this is the Atari is won over by food rule):
	now Atari is affectionate towards the player;
	continue the action.
	
After examining the black collar for the first time:
	carry out the learning Atari's name activity.
	
Instead of reading the black collar, try examining the black collar.

Instead of taking the black collar, say "If you take the collar off, you'll never be able to catch [Atari] when you want to."
		
Part 2 - People

the area is a subject. Understand "location" as the area.
fate is an unfamiliar subject.
artifacts are an unfamiliar subject.
the academy is an unfamiliar subject.
the coup is an unfamiliar subject.
the dungeon is an unfamiliar subject.
the charges is an unfamiliar subject.
taxes are a subject.

The tyrant king is a man. Understand "Darius" as the tyrant king. Understand "usurper" as the tyrant king.

Grandfather is a familiar man.

The fisherman is a man. "There is a man here, sitting on a rock with a fishing rod." The description is "He is a middle aged, balding man in relatively good shape." Understand "man" or "fisher" as the fisherman. 

The wizard is a man. "A small, aged man with a long beard sits in a brown recliner, smoking a pipe. He was reading a book when you barged into his home, but despite your rudeness, he looks up with a smile on his face. Something about him gives you a warm, friendly feeling." The wizard is evil. The description is "He's rather old. His is wearing nondescript gray robe, tied at the waist with a brown cord. A thin wisp of smoke comes out of the tobacco pipe he holds." Understand "Theodorus", "man", "old man" as the wizard.

Chapter 1 - The Lich

The lich is a man. "You see a skeletal lich here, surrounded with a vaguel violet aura." The description is "You see before you a lich. [if the lich is unexamined]Not that you've ever seen such a creature before, but you know it must be a lich from your days of playing Advanced Caverns & Wyverns (2nd edition) as an angsty teen. This is a creature that was likely a very powerful magic-user in its life, and voluntarily invoked some sort of powerful and long lost magic ritual that allowed it to exchange its mortality for eternal life as the undead creature you see before you. [end if]This creature's physical appearance is not much more than a skeleton wearing tattered clothing, but it is enveloped by a vague violet aura which, oddly enough, is something that you can't quite see when looking directly at it but it is plainly visible out of the corner of your eye. The eyes of the lich are nothing more than orange pinpoints of light, floating in the eye sockets of its skull. [/p]As you examine the lich, you come to the uncomfortable realization that the creature is examining you in turn." The lich is not proper-named. The lich is undead and evil.

lich-has-offered is a truth state that varies.
lich-has-been-greeted is a truth state that varies.

The ask-suggestions are { grandfather, wizard, king };

Greeting response for the lich:
	if lich-has-been-greeted is false:
		say "'Uh.. hello,' you manage to mumble. [/p]The lich turns its head toward you, and speaks, 'So, another foolish human has entered my domain. Have you come to plunder the treasures of the dead? Or perhaps you thought you'd make a name for youself by destroying me? Or have you come to deliver tribute?' You feel that cold, penetrating gaze staring deep into your soul. The lich's voice is thin and raspy, and you're not quite sure exactly where it's coming from since the creature lacks a voice box.";
	otherwise:
		say "You nod at the lich, presuming that silence is a better greeting for a creature like this. The lich nods back at you, rasping 'yes?'"
	
Instead of attacking the lich:
	say "The lich is remarkably quick at reacting, pointing its index finger bone in your direction and releasing a lightning bolt. It strikes you right in the chest.";
	if the player is wearing the crown:
		say "However, for some reason you are unhurt by it. [if the player does not carry the scepter]Upon seeing this, the lich laughs, 'Come at me, fool! It's been years since I had a good fight.' It appears prepared for the long haul in this.[end if]";
	otherwise:
		end the story.

Response of the lich when asked about grandfather for the first time and chosen quest is no-quest:
	say "'I[']m looking for my grandfather,' you say nervously, your voice cracking. [/p]The lich stares at you for a moment, and you almost think it has a thoughtful expression on its face.  'Yes, little goes on in these lands that I do not know about. Your grandfather was arrested by the tyrant usurper  and thrown in prison. He is alive, at the moment, but given the cruelty of that buffoon I do not know for how long.'";
	now the tyrant king is familiar;

lich-detailing-quest is a convnode. The node-time is 2. The next-node is lich-offering-quest. The ask-suggestions are { crown, scepter }.
lich-offering-quest is a closed convnode. The ask-suggestions are { crown, scepter }. The other-suggestions are { yes-no-suggestion }.

Default response for lich-detailing-quest:
	say "You begin to change the subject, but the lich threatens you, 'Do not waste my time with such trivialities, human. My patience has not improved over the years.'"
Default response for lich-offering-quest:
	say "You begin to change the subject, but the lich waves its hand in apparent exaspiration, 'I will answer your petty questions later.'"
	
node-introduction for lich-offering-quest:
	say "The lich bends toward you, tilting its head up. 'Do you accept my offer?'";
	
Response of the lich when asked about artifacts:
	say "'Tell me about the artifacts,' you request of the lich. [/p]'Which, the crown or the scepter?' it responds.";
	now the crown is familiar;
	now the scepter is familiar;

Response of the lich when asked about the tyrant king and chosen quest is no-quest:
	say "[node lich-detailing-quest]'What's that about a tyrant usurper?' you ask. [/p]The lich fixes its gaze on you. 'The despicable cur who sits on the throne now is nothing but a pretender who seized power and murdered my brother's son dishonorably in a coup many years ago. The true king is buried in the crypt above us. Many years ago, he was my brother. [/p]The lich glances to the side, as if momentarily considering something. Its gaze flicks back to you as it says, 'Perhaps you can be of some use to me,' the creature bellows. 'When the true king always had with him a crown and a scepter. Bring them to me, and I will personally see to it that your grandfather is freed from his prison.' You shudder at the thought of making a deal with such an obviously evil creature.";
	now the crown is familiar;
	now the scepter is familiar;
	now the coup is familiar;
	
Response of the lich when asked about the wizard:
	say "'[if the wizard is seen]I met a wizard in the woods south of here,[otherwise]What's this about a wizard?[end if]' you begin before being abruptly interrupted. [/p]'[if the wizard is seen]So, you've met Theodorus. H[otherwise]Yes, a despicable man, although powerful. He lives in the forest south of here. Stay away from his tower, h[end if]e is not to be trifled with; he is a master of illusions and deceptions. Do not trust what he says. Many years ago he helped the fool tyrant murder my nephew and seize the throne. [if wizard-has-offered is true]He seeks the crown and scepter because he has decided that the throne is too good for that fool Darius, and now Theodorus wants it for himself.[end if]".

Response of the lich when asked about "nephew":
	say "'What[']s this about your nephew?' you ask. [/p]'My nephew, Palir was the true heir to the throne,' the lich begins. 'He was killed by the usurper and Theodorus scant months after assuming power. Palir was really shaping up to be a good and just ruler, too. But evil men care only about themselves.'";
	now the tyrant king is familiar;
	now the wizard is familiar.
	
Response of the lich when asked about the crown and chosen quest is no-quest:
	say "'What can you tell me about the crown?' you ask. [/p]'The crown is buried above us, in the sarcophagus with my brother,' the lich answers. Well, that sounds easy. It continues, 'The sarcophagus is tightly sealed, an it is protected by a powerful magical ward that prevents any magic from being used to open it.' Okay, maybe not so easy."
	
Response of the lich when asked about the scepter and chosen quest is no-quest:
	say "'What can you tell me about the scepter? you ask. [/p]'I do not know where the scepter is,' replies the lich. 'If it is anywhere near here, it has not seen the light of day or been touched by a human hand since the true king died. I would know its location otherwise. The scepter likely still contains its considerable magical power, but it may not be entirely stable. Should you find it, I advise you to handle it very cautiously, human, lest it burn off your flesh and scorch your bones.' It might be just your imagination, but you could swear you saw a glimmer in the lich's eyes when it was discussing burning flesh and scorched bones."

Response of lich-offering-quest when saying yes:
	say "[leavenode]'Yes, I'm willing to do whatever it takes to get my grandfather back,' you stammer. [/p]The lich tilts its head to one side. 'Be careful when you say a thing like that, mortal creature,' it whispers softly. (gulp)[/p]'Come closer,' the lich beckons. In what may be the most courageous moment of your entire life so far, you step close to the undead creature. 'Hold out your hand.' You feel as though the power of the creature has taken control of your hands, making it impossible to refuse. You lift your right hand up to the lich, palm upward. The lich grasps your hand with its left. The bones of its hand are cold, freezing actually. Then, with a single bony index finger, the lich traces a strange symbol on your arm. The touch is like fire, and the pain intense. You scream out, but it is all you can do to bear the pain. As you regain your mental faculties, you realize you are kneeling, clutching your right forearm in pain. Removing your hand, you see the symbol the lich traced is burned into your skin. [/p]'That symbol grants you the power to see that which is hidden by magic,' the lich hisses into your ear. 'It also binds you to me. Betray me, and you shall quickly know my wrath. Now go, find me my artifacts.'";
	now the power symbol is part of the player;
	now the chosen quest is lich-quest.

Response of lich-offering-quest when saying no:
	say "[leavenode]'No, I cannot make such a deal,' you state with far less confidence than you wanted to. [/p]The lich stares at you for a moment, as if in disbelief that it would be rebuffed by such a pathetic mortal as yourself. 'Begone then, foolish mortal. Waste no more of my time.' The lich opens its hand, emitting a black smoke which reaches toward you with long, smoky fingers. The fear gets the best of you, and you turn and run, but no matter how hard you run the stairs just don't seem to be getting any closer. Finally, the smoke envelopes you and you feel yourself choking, losing consciousness... [/p]You wake to find yourself in...";
	now lich-has-offered is true;
	move the player to a random outdoors room that is not deep watery;

Response of the lich when asked about taxes:
	say "'So what's the deal with the tax situation?' you inquire. [/p]'Taxes are to supply the state with the funds to serve its people, nothing more. The foolish imposter sitting on the throne keeps far too much to himself.'"


Chapter 2 - The Wizard

wizard-has-been-greeted is a truth state that varies.
wizard-has-offered is a truth state that varies.
wizard-familiar-with-grandfather is a truth state that varies.

Default ask response for the wizard:
	say "The wizard responds, 'I'm not really sure about that.'";
	Now the ask-suggestions are { grandfather, fate, Atari, lich, king, mermaid }.
	
Greeting response for the wizard:
	if wizard-has-been-greeted is false:
		say "'Hi, um.. apologies for barging into your home,' you mumble, a bit embarrassed that you have just committed your first breaking and entering offense. [/p]'No worries,' says the wizard. 'It's rare that I get company all the way out here, please make yourself at home.' The wizard's friendliness makes you feel as though you were invited in to begin with.";
		now wizard-has-been-greeted is true;
	otherwise:
		say "'Hello,' you greet the wizard. [/p]'Hello again,' he responds.'"

Implicit greeting response for the wizard:
	say "'Heh, you're not much for formalities, are you?' the wizard chuckles."
	
Response of the wizard when asked about grandfather and chosen quest is no-quest:
	say "[one of]'I'm looking for my grandfather,' you mention. 'I think he may have disappeared from around here a couple of weeks ago.' [/p]'Ah, that is unfortunate,' says the wizard. 'Allow me to think for a moment.' The wizard pauses, taking a few long puffs from his pipe. [/p]'You know, I recall hearing a rumor about some elderly person that was arrested from the field north of here. I can't remember what the charge was but he was probably thrown in the castle dungeon by that tyrant of a king.'[or]'I'm looking for my grandfather,' you begin, but the wizard quickly interrupts you. [/p]'Yes, yes, I know, you said that already. [if wizard-has-offered is true]Have you reconsidered my request?'[node wizard-offering-quest][otherwise][wizard-resume-initial-convo]'[/l][end if][stopping]";
	now the tyrant king is familiar;
	now the castle is familiar;
	now the dungeon is familiar;
	now wizard-familiar-with-grandfather is true;
	now the charges are familiar;
	
To say wizard-resume-initial-convo:
	say "Now where were we? Weren't we talking about the king[if fate is familiar]? Or was it fate[end if]?[run paragraph on]".
	
Response of the wizard when asked about tyrant king:
	say "[one of]'So what's the deal with the king?' you ask. [/p]'Ach, that fool of a ruler,' the wizard spits out, his expression darkening for the first time. 'He rules with impunity, overtaxing his people simply to line his own coffers. It was a dark day when he came into power.' The wizard looks at you, a glint in his eye. 'I[']d stay out of his way, if I were you, lest you meet your grandfather's fate.'[or]As you start to ask about the king again, the wizard cuts you off. 'Let us not talk of him again. It is a dark state of affairs, and talking about it will not help things.[stopping]";
	now taxes are familiar;
	now fate is familiar.
	
Response of the wizard when asked about fate:
	say "[node wizard-detailing-quest]'What do you mean, my grandfather[']s fate?' you ask, nervous about what that might mean. [/p]'Oh sorry, I didn[']t mean to alarm you,' the wizard responds. 'I[']m sure he[']s alive and well. The king has his faults, but he is not quick to execute interlopers.' The wizard pauses, and stares at you thoughtfully. 'You know,' he begins, 'I might be able to help you to rescue your grandfather. The king was once a student of mine, and in spite of our differences, I still have some sway with him,' the wizard pauses, puffing on his pipe. 'There are two important national artifacts that have been missing for several years. If you could bring them to me I will speak to the king on your behalf. I'm sure that he would be willing to grant a favor to the person who finds and returns them.'";
	now artifacts is familiar.

Response of the wizard when asked about the area:
	say "'What can you tell me about this area?' you query. [/p]'Well it's a nice quite place to live, this far out in the woods,' says the wizard. 'North of here is a large field, in the woods west of that there is a lovely waterfall at the head of a stream which is just lovely for fishing. Far to the west is the beach, and a ways north of the stream are the town and castle.'";
	now the castle is familiar;
	now the waterfall is familiar;
	now the stream is familiar;

Response of the wizard when asked about the stream:
	say "'What do you know about the stream?' you ask. [/p]'I hear it[']s a nice place for fishing,' the wizard replies. '[if chosen quest is wizard-quest and the player does not have the blue crystal sphere]You should search around the banks for the key when it is raining.[end if] You will probably get more information from the townsfolk than me.'"
	
Response of the wizard when asked about the castle:
	say "'Tell me about the castle,' you ask. [/p]'Well, it's a castle, like any other I suppose. The tryant king rules from there,' the wizard answers.";
	now the dungeon is familiar;
	
Response of the wizard when asked about the dungeon:
	say "'What about the dungeon?' you ask. [/p][if wizard-familiar-with-grandfather is true]'Yes, yes, there no doubt that is where your grandfather is being held,' he responds. 'The dungeon is well guarded; if you're thinking about trying to storm the castle to break your grandather out of jail, you should forget that thought immediately.'[otherwise]'The dungeon?' the wizard responds, with a look of mild surprise on his face. 'That's where individuals accused of crimes are held. Why would you be interested in it?'[end if]"
	
wizard-detailing-quest is a convnode. The node-time is 3. The next-node is wizard-offering-quest. The ask-suggestions are { artifacts, crown, scepter }.
wizard-offering-quest is a closed convnode. The ask-suggestions are { artifacts, crown, scepter }. The other-suggestions are { yes-no-suggestion }.

Default response for wizard-offering-quest:
	say "You begin to change the subject, but the wizard interrupts you, 'No, no, let's come back to that subject. This is important.'"
	
node-introduction for wizard-offering-quest:
	now wizard-has-offered is true;
	say "The wizard looks at you pointedly, leaning forward in his chair. 'So what do you say? Will you look for the crown and scepter?'"
	
Response of wizard-detailing-quest when asked about artifacts:
	say "[wizard-artifact-description]";
	now crown is familiar;
	now scepter is familiar;
	now artifacts is not familiar;
	
Response of wizard-offering-quest when asked about artifacts:
	say "[wizard-artifact-description]";
	now crown is familiar;
	now scepter is familiar;
	now artifacts is not familiar;
	
Response of the wizard when asked about the crown:
	say "[wizard-crown-description]";
Response of the wizard when asked about the scepter:
	say "[wizard-scepter-description]";
Response of wizard-offering-quest when asked about the crown:
	say "[wizard-crown-description]";
Response of wizard-offering-quest when asked about the scepter:
	say "[wizard-scepter-description]";
	
node-continuation for wizard-offering-quest:
	if a random chance of 1 in 2 succeeds:
		say "'Well, what do you think?' the wizard asks. 'Will you look for the crown and scepter?'"

node-termination for wizard-offering-quest when going:
	say "As you begin to leave, the wizard interrupts you, 'wait, before you go, I would like an answer. Will you look for the crown and scepter?'";
	now conversed-this-turn is true;
	
node-termination for wizard-offering-quest when saying goodbye to wizard:
	say "[leavenode]You bid the wizard farewell in response to his question. [/p]'Well, if you change your mind, I will be here,' states the wizard.";
	now conversed-this-turn is true;
	
To say wizard-crown-description:
	say "'What can you tell me about the crown?' you ask. [/p]'Ah the crown,' the wizard sighs. 'It was a wonderfully beautiful object to behold. It's made of solid gold, and encrusted with all manner of rare and valuable jewels, but it is light-weight and slim for a real elegant look. I saw it up close once, you know, when I was but a lad who had barely seen eight summers. Some say it had some sort of magical power. Rumor has it, the crown was buried with the king when he died.' The wizard puffs on his pipe again and lets out a sigh. 'Unfortunately, in these dark times thievery runs rampant. The mausoleum where he is buried has been thoroughly ransack by brigands, and this wonderful national treasure has long been lost.'"

To say wizard-scepter-description:
	say "'What about the scepter?' you ask. [/p]The wizard pauses for a moment, collecting his thoughts. 'Little is really known about the scepter. The former king always carried it with him, but it was rarely prominently displayed. There was some rumor that after his death it fell into the possession of a friend of his, who captained a ship. One day, that ship set sail and never returned. Some say the ship was sunk in a great battle by pirates, others say the ship ran aground on a reef somewhere and the crew ended up starving.' [/p]Another long drag on the pipe, and then the wizard shrugs, 'Perhaps they simply found treasure somewhere and have retired to some island paradise. No one even knows if the scepter was on the ship when it disappeared.' The wizard stares off into the distance, as if remembering some long-forgotten painful event. 'Even with my skill with magical scrying, I have been unable to locate the scepter.'"
	
Response of wizard-offering-quest when saying yes:
	say "[leavenode]'Yes, if it will help me get my grandfather back, I'll do it,' you reply in the affirmative. [/p]'Excellent!' announces the wizard. 'I have a gift for you. I suspect you will need to return to your own home to gather things which may help you find the crown and scepter. Somewhere near the waterfall there is a key for a lost traveler to return home, but that such a key can only be found during a terrible storm. I will give you this wand of weather-changing. It's very easy to use, all you need to do is wave the wand and it will effect a change in the weather. I'd suggest digging in the sand around the banks near the waterfall for that key.' [/p]The wizard holds out his hand offering you the wand, which you take carefully. [/p]'Be sure and bring the crown and scepter back to me,' the wizard continues, 'and be careful who you show them to. There are many out there who would think nothing of killing you to obtain these artifacts.'";
	now the player carries the wand of weather-changing;
	now the chosen quest is wizard-quest.
	
Response of wizard-offering-quest when saying no:
	say "[leavenode]'No, I think I'd better find another way to free him,' you respond. [/p]A look of momentary disappointment falls across the wizard's face as he slumps back into his shair, but it's gone as quickly as you noticed it. 'I understand, I understand,' he repeats. 'You must do what you think is best, of course, of course.' He takes another long drag off his pipe. 'I'll be here if you change your mind, of course.'"
		
To say wizard-artifact-description:
	say "'What artifacts are you looking for?' you ask. [/p]'There are two of them,' the wizard repeats. He pauses thoughtfully, taking one long puff on his pipe. 'I am looking for a crown and a scepter. They both belonged to a previous king from a few generations back, a fair and just man by the name of Dalton. His crown and scepter both disappeared when he died. Bring me those items, and I will see that your grandfather is returned to you.' The wizard stares at you. You are suddenly awash with the feeling that this is an individual with considerable power.";
		

Response of the wizard when asked about Atari:
	if Atari is in the location or Atari is carried by the player:
		say "'So what do you think about dogs?' you ask. [/p]'Well I'm not much of a dog person myself. It's a shame your animal is not more friendly.' [/p]'Yes, I'm sorry about that,' you apologize. 'I don't know what's gotten into her.'";
	otherwise:
		say "'Have you seen [the Atari] around?' you ask. [/p]";
		say "'[if Atari is proper-named]Oh you mean that little brown dog?[run paragraph on][otherwise]Yes, I[']ve seen that little brown dog running around.[run paragraph on][end if]' he replies. 'Yes, yes, she seems very friendly.' [/p]";

Response of the wizard when asked about the lich:
	say "'What[']s with the lich?' you ask. [/p]'Ah, you've met that accursed creature, have you?' the wizard asks sympathetically. [if lich-has-offered is true]'And I suppose it has asked you to bring the crown and scepter to it?' he continues rhetorically. [end if]The wizard pauses, holding his pipe just in front of his face, looking at you with one hairy eyeball. 'Do not trust that creature, whatever you do. It is fiendishly evil and cunning. It was once the brother of the old king, Dalton. Dalton was the elder brother, so he spent his time studying the affairs of the state. The younger brother had no interest in these matters, and instead turned to the study of magic. He and I were actually students together at the academy, you know.' The wizard pauses, remembering better times. With a sigh, he says, 'Lucius had such great talent, but after his brother died, he became obsessed with death, living forever, raising the dead, and all manner of unholy acts. He came to learn the secrets of dark magics that have long been buried, or should have been.' After another puff on the pipe, he continues, 'He eventually traded his living flesh for eternal life as that horrid creature.' [/p]After a long sigh, he says, 'as is always the case with such powerful magic, the evils of it eventually consumed him. Myself and three colleagues wove some powerful magic to confine him to his current prison. Even with the great power we had, it cost us dearly, as I was the only one to walk away from that ordeal with my life.' There is a long silence.";
	now the academy is familiar.
	
Response of the wizard when given the jeweled crown:
	move the crown to the wizard;
	say "You give [the crown] to the wizard. [/p]";
	if the wizard has the crown and the wizard has the scepter:
		say "[wizard-takes-castle]";
	else:
		say "'Ah, excellent, you've found the crown!' the wizard exclaims. 'Yes, yes, this is wonderful. Now you just need to find the scepter.'"
		
Response of the wizard when given the scepter:
	move the scepter to the wizard;
	say "You give [the scepter] to the wizard. [/p]";
	if the wizard has the crown and the wizard has the scepter:
		say "[wizard-takes-castle]";
	else:
		say "'Wonderful, it's the scepter!' the wizard exclaims. 'Yes, yes, this is absolutely wonderful to have recovered this national treasure. Now you just need to find the crown.'"
		
Default response of the wizard when given something:
	say "You offer [the noun] to the wizard. 'No, no thank you,' the wizard politely declines.";
	
To say wizard-takes-castle:
	say "Now I win!";
	
	
Chapter 3 - The Tyrant King

Chapter 4 - Grandfather

Chapter 5 - The Fisherman

The fishing rod is carried by the fisherman. The description is "It's nothing fancy."

fisherman-seen-crown is a truth state that varies.
fisherman-seen-scepter is a truth state that varies.
To decide whether fisherman-seen-both:
	if fisherman-seen-crown is true and fisherman-seen-scepter is true, yes;
	no.

Default response of the fisherman:
	say "You ask the fisherman about [the noun]. 'Well I don't know much about that,' he replies."
	
Response of the fisherman when asked about taxes:
	now the dungeon is familiar;
	say "'So how are the taxes here?' you ask. [/p][one of]'Err, well I don't know,' the fisherman answers nervously. Glancing around, he lowers his voice and mutters, 'people who talk too much about that sort of thing wind up in the dungeons.'[or]'Sorry, I can't talk about that.' Your question seems to have made him uncomfortable[stopping]".

Response of the fisherman when asked-or-told about the wizard:
	now the king is familiar;
	say "'What do you think about [one of]the wizard[or]Theodorus[stopping]?' you ask. [/p]'[if fisherman-seen-both]Hmm... the old man is certainly worldly,' the fisherman thinks for a moment. 'But I'm not sure he'd be the best ruler. He has little pity for those who are poor or starving.'[otherwise][one of]You mean Theodorus? [or][stopping]Well, he's been around a long time,' the fisherman begins. 'He worked a lot in helping the revolution which placed his majesty on the throne. The two of them have had some disagreements lately.' The fisherman glances around, and motions you in close. 'I wouldn't be suprised if ol' Theo regrets his role in the coup that replaced the former king.'[end if]"

Response of the fisherman when asked-or-told about the lich:
	now the king is familiar;
	say "'[if the lich is seen]I met a lich in the mausoleum,[otherwise]I have heard something about a lich,[end if]' you begin. [/p][if fisherman-seen-both]'You want to give the power to rule the land in the hands of that undead creature?' the fisherman asks, aghast. 'It might want to avenge its brother's death, but I can't imagine the country prospering under its rule. Still,' he considers, 'it might be better than Darius.[otherwise]'Ugh, that foul undead creature,' the fisherman exclaims. He pauses a moment to spit into the stream. 'That lich was the king's brother, the old king Dalton I mean. He turned to dark magics and turned himself into that... thing.[end if]'"

Response of the fisherman when asked-or-told about the king:
	say "'What can you tell me about the king?' you ask. [/p][if fisherman-seen-both]'If you give the crown and scepter to him, his position as ruler of this land will be secured for a long, long time,' the fisherman responds. 'He already ruthlessly taxes the people to get rich, and swiftly jails anyone who speaking against him. I beg you, do not give the crown and scepter to that man.'[otherwise]'Hmm... I really don't have much to say about him,' the fisherman responds. He seems to want to avoid discussing the topic."

Response of the fisherman when asked-or-told about the crown:
	if fisherman-seen-both:
		say "[fisherman-seen-crown-and-scepter]";
	otherwise:
		say "'I heard something about a crown,' you begin. [/p]'You mean the jeweled crown of the old king?' the fisherman interrupts. 'Yeah it was quite a sight. I saw it a few times when I was a wee lad. It was supposed to be buried with the old king. Long gone, probably, stolen by thieves. People often whispered that it had some sort of magical power. Well, I don't know about that, but it sure was gorgeous.'"

Response of the fisherman when shown the crown:
	now fisherman-seen-crown is true;
	say "You show [the crown] to the fisherman. [if fisherman-seen-both][fisherman-seen-crown-and-scepter][otherwise]'Oh my!' the fisherman exclaims. 'You actually found it. This is the closest I've even been to it.' After briefly examining the crown, he look you in the eye and says, 'you shouldn't go walking around flaunting this about. Someone might get it in their head to take it from you forcefully, if you know I mean.'[end if]";

Response of the fisherman when given the crown:
	now fisherman-seen-crown is true;
	say "You offer [the crown] to the fisherman. [if fisherman-seen-both][fisherman-seen-crown-and-scepter][otherwise]'Oh dear...' he pauses. 'I can't possibly accept that. I can't really give you advice on what to do with it.'[end if]"

Response of the fisherman when shown the scepter:
	now fisherman-seen-scepter is true;
	say "You show [the scepter] to the fisherman. ";
	if fisherman-seen-both:
		say "[fisherman-seen-crown-and-scepter]";
	otherwise:
		say "'Oh what is this?' the fisherman exclaims. 'Oh... is this the scepter that used to belong to Dalton? Wow, how did you find it? I'd be careful with it, and not just because other people might want to take it from you. I've heard that it has some magical power. But that sort of thing is dangerous unless you know what you're doing.'";

Response of the fisherman when given the scepter:
	now fisherman-seen-scepter is true;
	say "You offer [the scepter] to the fisherman. [if fisherman-seen-both][fisherman-seen-crown-and-scepter][otherwise]'Oh dear...' he pauses. 'I can't possibly accept that. I can't really give you advice on what to do with it.'[end if]"

To say fisherman-seen-crown-and-scepter:
	say "[one of]'Wow, you've managed to find both the crown and the scepter. You know, that reminds me... I remember hearing around when the coup happened that whoever ended up with the crown and scepter would rule the land. But they both vanished. And now you have both,' he pauses thoughtfully. 'What will you do with them? Are you going to give them to someone?'[or]'Hmm... maybe there is a way that you could learn how to use the crown and scepter for yourself?' he ponders. 'They're supposed to be magic,' he continues, 'and if you could find a way to harness that magic, you could displace the king.' [/p]'How would I do that?' you ask. [/p]'Well I certainly wouldn't know. But if I were you, I might start searching around in the mausoleum to see if there was some clue as to their use buried with the king. Either that, or Theodorus might know, although I doubt he'd help you directly. If you could sneak into the laboratory in his tower, you might find a clue there.[stopping]";

Response of the fisherman when asked-or-told about the scepter:
	if fisherman-seen-both:
		say "[fisherman-seen-crown-and-scepter]";
	otherwise:
		say "'I heard that the scepter was lost,' you say. [/p]'Yeah, that old scepter that Dalton used to carry around,' the fisherman answers. 'It was supposed to be some sort of powerful magical artifact, but it takes some sort of skill to use it.'"

Response of the fisherman when asked-or-told about the castle:
	now the king is familiar;
	now the dungeon is familiar;
	say "'What can you tell me about the castle?' you ask. [/p]'Head north to the end of town, then east. You can't miss it.' he responds. 'But don't think much about getting an audience with the king. Even if you get it he will probably have you thrown in the dungeon for wasting his time.'"
	

Response of the fisherman when asked-or-told about grandfather:
	now king is familiar;
	now atari is familiar;
	now castle is familiar;
	say "'I'm looking for my grandfather,' you begin. [/p]'Oh yes, I met him a while back,' the fisherman responds. 'He mentioned having a grandchild that looks like you. Good fishing companion, that old guy. [if the fisherman can see atari]I see you've brought his dog. [otherwise]Have you seen his dog around? [end if]I haven't seen your grandpops in a while. I hope he didn't get thrown in the dungeon. The king is a bit, ah, finicky these days.'"
	
Response of the fisherman when asked about "fishing":
	say "'Catching anything today?' you ask. [/p]'No, nothing yet,' the fisherman replies."
	
Response of the fisherman when asked about the fishing rod:
	say "'That's a nice fishing rod,' you say. [/p]'Yes, you like it?' he replies. 'I made it myself.'";
	

Chapter 6 - Castle Guards

Chapter 7 - Townsfolk

Book 3 - Scenes

Prologue is a scene. Prologue begins when play begins. Prologue ends when the player is in the Basement.
Returning Home is a scene. Returning home begins when prologue ends. Returning home ends when the player is in under the stairs.
Stocking Up is a scene. Stocking up begins when returning home ends.	

Weather delay is a number that varies.

Every turn during stocking up:
	decrement weather delay;
	if weather delay is less than 0:
		let weather delay be a random number from 2 to 6;
		let X be a random number from 1 to 3;
		if X is 1, now the weather is light-rain;
		if X is 2, now the weather is medium-rain;
		if X is 3, now the weather is heavy-rain;

	
Volume 3 - Rooms

Book 1 - Your grandfather's house

Under the stairs is a room. "You are in the secret room beneath the stairs in your grandfather's house. Shelves line the walls here, with a lot of junk on them. Your grandfather was an avid collector of antiques, but you can tell from the vast array of broken clocks and watches, scratched dishes, tarnished silverware and other junk before you that he doesn't have quite the eye for valuable antiques. There is so much junk that it would take a thorough search to find anything useful. One item does catch your eye, however, the full-length, oval-shaped mirror with a beautiful stand in the corner."

The house mirror is scenery in under the stairs.  The printed name of the house mirror is "mirror".The description is "The frame of the mirror is beautifully crafted, with intricate designs running up and down the length of the mirror and appears to be plated with gold. As you peer into glass of the mirror, you are surprised to see that it does not reflect back. All you see is what appears to be a bluish mist inside it. It almost feels as though it could pull you inside..." The stand is part of the house mirror. The description is "The stand of the mirror is a gorgeous golden color, covered with a symbols carved into it." The symbols are part of the mirror. The description is "The symbols are very artistically done, but you don't know if they have any meaning."
The blue mist 1 is a part of the house mirror. The printed name is "mist".The description is "You see what appears to be bluish mist inside the mirror. It's almost a solid blue color, and you'd think that it was just static, but here and there you see wisps of different shades of blue moving through it. Looking at the mist is mesmerizing, and you feel as something is compeling you to step through the mirror."
Instead of searching the mirror, try examining the mist.

Instead of entering the mist in under the stairs: try entering the mirror.
Instead of entering the mirror:
	say "You step through the mirror, and you feel a powerful force pulling you through. After being momentarily blinded, you find yourself in... [/p]";
	move the player to the Basement. 
Instead of attacking the mirror:
	say "Something compels you not to."
Report touching the mirror:
	say "You feel a tingling in your fingers, as if there is some unknown energy within the mirror itself.";
	stop the action.
	
The stair shelves are a supporter in under the stairs. It is scenery. The description is "It's mostly junk. There are some broken clocks, and some crappy antique dishware. It would take a while to search through it all to find something useful." The printed name is "shelves". Understand "shelf" as the stair shelves.
Instead of searching the shelves for the first time:
	say "You poke around on the shelves for a little while, stirring up a bunch of dust. Most of the items are thoroughly worthless, but a piece of paper catches your eye.";
	move journal page 1 to the stair shelves;
	increase the score by 1.
Instead of searching the shelves:
	say "You poke around on the shelves a bit more, but you don't find anything useful."
	
The junk is scenery in under the stairs. Understand "antique" or "antiques" or "clocks" or "dishes" or "silverware" as the junk. The description is "It's a bunch of junky antiques. None of it seems to be particularly valuable. Maybe there is something useful, but a thorough search would take some time."
Instead of taking the junk, say "There's really no reason to carry that junk around."
Instead of searching the junk, try searching the stair shelves.

The secret door is a scenery door. It is south from under the stairs. It is closed. The description is "The door [if closed]is shut[else]is open[end if]."
Instead of examining the secret door during prologue, say "The door has shut behind you, and there doesn't seem to be any handle or latch on this side of it. You'd look closer, but that mirror is just too darn distracting.".

Check opening the secret door during prologue:
	say "You don't see any way to open the door." instead.
	
After opening the secret door:
	say "Ah, you've found the latch. Finally you get back into the house. And now you know where your grandfather went off to, perhaps you will rescue him someday.";
	end the story finally.

Grandfather's house is a region. Under the stairs is in grandfather's house.

Book 2 - The great forest

Part 1 - The shack

Chapter 1 - Basement

Basement is a room. "[if not visited]You appear to be in some sort of Basement, lit solely by a lantern on a shelf.[else]You are in the basement of the shack.[end if] Shelves line the east and north walls, but they are mostly empty. A beautiful mirror stands against the south wall. A ladder pokes through the ceiling in the corner of the room."

The basement shelves are a supporter in basement. They are scenery. Understand "shelf" as basement shelves. The printed name is "shelves". The description is "The construction of the shelves appears to have been crudely done. They seem to have been constructed recently."

The brass lantern is on the basement shelves.	
Journal page 2 is on the basement shelves.
	
The basement mirror is scenery in basement. The printed name is "mirror". The description is "It's a beautiful mirror, nearly identical to the one in your grandfather's house. [if mirror is active]You see a fine blue mist when peering into the mirror. [otherwise]However, you only see your reflection when looking in the mirror.[end if]"

To decide if the mirror is active:
	if the player has the blue crystal sphere, decide yes;
	decide no.
	
Instead of attacking the mirror:
	say "This mirror is probably your only way home, so smashing it is a really silly idea."
Instead of throwing something at the mirror:
	say "That might damage the mirror, and this mirror is probably your only way home, so thst seems like a bad idea."
	
Instead of entering the mirror:
	if the mirror is active:
		say "You step through the mirror, and you feel a powerful force pulling you through. After being momentarily blinded, you find yourself in...[/p]";
		move the player to under the stairs; 
	otherwise:
		say "You bump your nose on the glass. Apparently whatever magical energies brought you here aren't around at the moment to get you back home."
		
Up from basement is shack interior.

The wooden ladder is a backdrop. It is in basement and shack interior. The description is "It's a sturdy wooden ladder, poking through a hole in the [if the location is basement]ceiling[else]floor[end if]."
Instead of climbing the ladder in basement, try going up.
Instead of climbing the ladder in shack interior, try going down.


Chapter 2 - Shack interior

The Shack Interior is a room. "You are inside a dilapidated shack. There is a rather shabby door on the south side, which is [if the shabby door is open]open[otherwise]closed[end if]. This appears to be someone's actual living quarters, as the furnishings are rather complete. It's only one room but there is a kitchen space for cooking as well as a creaky bed. A desk is in the corner, covered in stacks of paper. A ladder pokes through a hole in the floor." The printed name of the shack interior is "Inside the Shack". 
The creaky bed is an enterable supporter in the shack interior. It is comfortable. It is scenery. The description is "It's a twin-sized bed in rather poor condition, although the mattress does not look too uncomfortable."
The kitchen counter is scenery in the shack interior. The description is "It's a countertop used for preparing food. There is no sink or dishwasher or any of those sorts of amenities." 
A piece of beef jerky is on the kitchen counter. It is edible. The description is "It's a piece of beef jerky, probably meant as a treat for dogs."
Report eating the beef jerky: say "You eat the jerky. Well, it was edible, but the taste makes you think that maybe it was meant to be a dog treat." instead.

The kitchen cupboard is a closed openable container in shack interior. It is scenery. The description is "The cupboard is crudely fashioned, and is somewhat small. [if cupboard is open]The cupboard is open, containing [list of things contained in cupboard].[else]It is closed." Understand "cabinet" as cupboard.
The stack of papers is scenery in shack interior. The description is "You see a whole mess of papers on the desk. Someone has been working very diligently here, but they are clearly not a very organized person. Hmm, your grandfather was also not a very organized person. It might be worthwhile to search through them." Understand "paper/papers" or "paper/papers" or "mess" or "mess of papers" as the stack of papers. 
Does the player mean doing something with the stack of papers: it is unlikely.
Instead of searching the stack of papers, try searching the desk.

A milkbone is a kind of thing. A milkbone is always edible.
Inside the cupboard is a doggie bag. The bag is an openable closed container. There are 36 milkbones in the bag.
Report the player eating a milkbone: say "You eat the milkbone. It's disgusting." instead.

The shack desk is a supporter in the shack interior. It is scenery. The printed name is "desk". The description is "The desk is covered in papers. There might be some clues as to your grandfather's whereabouts in them, but it would take a thorough search to find something useful."
Instead of opening the desk, say "The desk is very simple, and it doesn't have any drawers."

The pile of papers is a thing. It is fixed in place. "On the floor is the mess of papers you knocked off the desk."
Instead of taking the pile of papers, say "You clean up the papers on the floor and reintegrate them into the mess on the desk."
Instead of searching the pile of papers, say "There doesn't seem to be anything useful in these papers."

Instead of searching the desk for the first time:
	say "As you search through the papers on the desk you manage to knock a large stack of papers onto the floor, including a couple of pages from a journal that look interesting.";
	move the pile of papers to the shack interior;
	move journal page 3 to the shack interior;
	move journal page 4 to the shack interior;
	move journal page 5 to the shack desk;
	if atari is in shack interior, now the interesting item of atari is journal page 4.

Instead of searching the desk:
	say "You search through the papers on the desk, more carefully this time, but you don't find anything that looks useful."
Instead of going south in shack interior, try going outside.

The shabby shack is a region. Shack interior, basement are in shabby shack. It is indoors.

Part 2 - The field

West Field is a room. "You are in the west end of a large, grassy field, surrounded by tall trees. Nestled against the trees at the north end, you see a dilapidated shack. A narrow path goes southwest into the trees." It is west of East Field. 
A stick is a dog toy in west field.

The shabby door is a door. It is inside from West Field and outside from The Shack Interior. It is scenery. The description is "The door is in rather poor condition. The elements have not been kind to it." 
Before going through the closed shabby door:
	say "(first opening the door of the shack)[command clarification break]";
	silently try opening the shabby door.  

Instead of entering the dilapidated shack in west field:
	try entering the shabby door.

East Field is a room. "You are at the east end of a large, grassy field. Far to the west in the distance you see a small shack. A narrow path cuts through the trees to the northeast. To the south, another path goes into the forest." 

A bovine skeleton is a corpse in east field. "The remains of a large cow have been rotting here for quite a while, so that only a skeleton is left." Understand "cow" or "bone" or "bones" as the bovine skeleton. The description is "This cow must have died a long time ago, as all that is left are bones." The detachable part of the bovine skeleton is a dog toy called a bovine bone. The canine-interest of the bovine bone is 60. The initial-durability of the bovine bone is 35. The weight of the bovine bone is 5.
Does the player mean doing something with the bovine skeleton: it is very unlikely.
Does the player mean doing something with the bovine bone: it is likely.


Forest Clearing is a room. It is northeast of east field. "You are in a small clearing deep in the woods, surrounded by tall trees. A lone stone mausoleum rises solemnly from the center of the clearing, with dead grass around it. A narrow path cuts through the trees to the southwest. "

The dilapidated shack is a backdrop. It is in west field, east field and the shack interior. The description is "It's a small shack, in rather poor condition."
Instead of examining the dilapidated shack in east field, say "The shack is too far away to make out much detail."
Instead of examining the dilapidated shack in shack interior, try looking.
Instead of entering the dilapidated shack in west field, try going north.
Instead of entering the dilapidated shack in east field, say "You'll have to get closer first. Try going west."
Does the player mean entering the dilapidated shack: it is very likely.
Does the player mean examining the dilapidated shack: it is very likely.

The mausoleum entrance is scenery in forest clearing.
Instead of entering the mausoleum entrance, try going inside.
Mausoleum Entry is inside from forest clearing.

Creepy Forest Path is a room. It is south from east field. "You are on a north-south path through the woods. The trees in this area are twisted and creepy, and the canopy blocks all but a few slivers of light from above."

Part 3 - Forest path and stream

Narrow Forest Path is a room. It is southwest of west field. "You are in the midst of a dense forest, on a narrow path. The path heads off toward a field in the northeast, and to the west heads deeper into the woods. [if the location is not wet]You can hear birds chirping in the trees, and the sound of rushing water nearby.[end if]"

Path by Stream is a room. It is west of narrow forest path. "The forest path continues west-east. There is a stream just north of the path with water flowing to the west. It looks as though you could hike down to the stream here. The trees seem to be thinning out to the west."

South Stream Bank is a room. It is north of path by stream. "[if the player is in the kayak]You float near the southern bank of the stream.[otherwise]You are at the southern bank of the stream.[end if] The water flows steadily to the west, and it [if the player is in the kayak]is[otherwise]looks[end if] fairly shallow at this point. [if the player is in the kayak]Far to the west you see the stream opens up into a vast ocean. The trees of the forest densly populate the banks on the north and south sides of the stream. You can paddle upstream to the east.[otherwise]The trees of the forest surround you, and you see the forest continues on the north side of the stream. There appears to be a shallow sand bar in the stream to the north; you might be able to wade across to it. You see there is enough of a bank for you to travel to the east or southwest along the stream edge.[end if]". It is watery.
Report going northwest from south stream bank when the player is not in the kayak:
	say "You wade through the stream...";
Report going east from south stream bank when the player is not in the kayak:
	say "You walk carefully along the edge of the stream."
Report going west from south stream bank when the player is not in the kayak:
	say "You walk carefully along the edge of the stream."

Index map with south stream bank mapped north of path by stream.

Sand Bar is a room. It is northwest of south stream bank. "[if the player is in the kayak]You float near a shallow sand bar at the mouth of the stream.[otherwise]You stand atop a shallow sand bar at the mouth of the stream.[end if] The water runs slowly over it[if the player is not in the kayak], just up to your ankles[end if]. To the east you see that the stream gets narrower and the water flows faster, with several rocky areas. Far in the distance beyond that, you see a large waterfall. A vast ocean sprawls out to the west." It is watery.
The blue crystal sphere is here.

Instead of going east from Sand Bar when the player is in the kayak, try going northeast.
Instead of going east from Sand Bar when the player is not in the kayak, say "The water is too deep to wade in."
Report going northeast from Sand Bar when the player is not in the kayak:
	say "You wade through the stream...";
Report going southeast from Sand Bar when the player is not in the kayak:
	say "You wade through the stream...";
Report going nowhere from Sand Bar when the player is not in the kayak:
	say "The stream looks to be moving too fast to go in that direction." instead.

North Stream Bank is a room. It is northeast of sand bar. "This is the northern bank of the stream. [if the player is in the kayak]You float near[otherwise]You stand atop[end if] a small muddy beach. The forest comes right up to the edge of the shore[if the player is not in the kayak], although it looks like you might be able to proceed east along the shore[end if]. To the south you see a sand bar in the middle of the stream. A path goes through the trees to the north." It is watery.
Report going southwest from north stream bank when the player is not in the kayak:
	say "You wade through the stream...";
Report going east from north stream bank when the player is not in the kayak:
	say "You walk carefully along the edge of the stream."
Instead of going west from north stream bank when the player is not in the kayak:
	say "There are too many rocks to proceed to the west.";
	
Stream Bend is a room. It is east of south stream bank. "You are on a rocky bank of the stream, which flows from the northeast to the west. In the northeast, you see that the stream flows from a magnificent waterfall. The rock formations in the water redirect the fast flow of the stream into several small pools, where the water stagnates and reeds grow out of it like there's no tomorrow. You detect the faint smell of decaying matter here." It is watery. East of stream bend is west field.

Index map with stream bend mapped east of south stream bank.

Rocky outcropping is a room. It is east of north stream bank and west of Waterfall North Bank. "This bank of the stream is rather rocky, but you can still navigate it. The stream bank continues east-west. In the distance to the east, you see a magnificent waterfall."
The fisherman is here.

Part 4 - Waterfall

Waterfall North Bank is a room. "[if the player is in the kayak]You are floating in your kayak at[otherwise]You stand on the bank of[end if] the west side of a large pool, at the base of a fantastic waterfall. The noise of the waterfall is deafening[if location is wet], drowning out even the sound of the rain[end if]." It is watery.
Report going west from waterfall north bank:
	say "You walk carefully along the edge of the stream."
Instead of going south from waterfall north bank when the player is not in the kayak:
	say "There doesn't seem to be any path here to the other bank of the stream. You're going to have to find another way around."
Instead of going up from waterfall north bank:
	say "The rocks are too treacherous to climb."
Instead of going east from waterfall north bank:
	say "There's a solid rock wall blocking you."
	
Waterfall South Bank is a room. Southwest of waterfall south bank is stream bend.   "[if the player is in the kayak]You are floating in your kayak at[otherwise]You stand on the bank of[end if] the east side of a large pool, at the base of a fantastic waterfall. The noise of the waterfall is deafening[if location is wet], drowning out even the sound of the rain[end if]. There is a path through the trees to the east." It is watery. North of waterfall south bank is waterfall north bank.
Report going southwest from waterfall south bank:
	say "You walk carefully along the edge of the stream as it curves to the west."
Instead of going north from waterfall south bank when the player is not in the kayak:
	say "There doesn't seem to be any path here to the other bank of the stream. You're going to have to find another way around."
Instead of going up from waterfall south bank:
	say "The rocks are too treacherous to climb."
Instead of going east from waterfall south bank:
	say "There's a solid rock wall blocking you."
	
There is a backdrop called the waterfall. It is in waterfall north bank and waterfall south bank and sand bar and stream bend and rocky outcropping. It is scenery. The description is "The waterfall extends probably about two hundred feet vertically, in a breath-takingly beautiful sight. [if location is not wet]You see a the hint of a rainbow in the mist coming off the waterfall.[end if][if the player is in the kayak] You see a dark shadow at the base of the waterfall. It's hard to tell, but it might be some sort of cavern.[end if]"

Instead of entering the stream when the player is in waterfall north bank or the player is in waterfall south bank or the player is in stream bend or the player is in rocky outcropping:
	if the player is in the kayak:
		try exiting;
	otherwise:
		say "You jump into the stream, but with the water running so fast you are dragged downstream faster than you can do anything. The white water going over the rocks is rather cruel. ";
		if a random chance of 1 in 8 succeeds and the player is not wearing the crown:
			end the story saying "You broke your neck on a rock";
		otherwise:
			say "After the ordeal is over, you find yourself washed ashore...";
			let x be a random number from 1 to 4;
			if x is 1, move the player to north stream bank;
			if x is 2, move the player to sand bar;
			if x is 3, move the player to south stream bank;
			if x is 4, move the player to Beach N;
		
There is a backdrop called stream. It is in waterfall south bank, waterfall north bank, south stream bank, sand bar, north stream bank, path by stream, and Beach N. Understand "water" as the stream. The description is "It's a good sized stream of water. The water looks [if location is south stream bank or location is north stream bank]slow and shallow enough that you might be able to wade across it[otherwise]like it is fast-moving and dangerous[end if]."

Instead of entering the waterfall while the player is in the kayak and (the location is waterfall north bank or the location is waterfall south bank):
	say "You take a deep breath, and paddle your kayak right into the waterfall!";
	move the player to cave inside waterfall.
	
Instead of entering the waterfall in sand bar: say "The waterfall is much too far away for that!";
Instead of entering the waterfall: say "There doesn't seem to be a path through the rocks to get close enough."

Cave Inside Waterfall is a room. "You are in a small cave inside the waterfall. This room doesn't have anything in it yet, but when it does it will be awesome." It is watery.

[
Clifftop is a room. "You are atop a rocky cliff, the highest location around. The entrance to the mausoleum here. You see a great forest around you, except for a clearing in the southwesterly direction. Far in the distance to the west you see an ocean. A viable path through the rocks goes to the southeast." Mausoleum entry is inside from clifftop. Clifftop is north from mausoleum entry. Instead of an actor going down from clifftop, try the actor going southeast.

Rocky Ledge is a room. "You are on a small rocky ledge, precariously jutting out of the cliffside here. You can see a way to climb up to the top of the cliff. There a path to the south leading down into the forest." Rocky ledge is southeast from clifftop. Clifftop is up from rocky ledge.  Rocky ledge is northeast from east field.
]

	
Part 5 - Region

The Great Forest is a region. It is outdoors. West Field, East Field, Narrow Forest Path, Path by stream,  north stream bank, south stream bank, forest clearing, waterfall north bank, waterfall south bank, stream bend, rocky outcropping, creepy forest path are in the great forest.

The coniferous forest is a backdrop. Understand "trees" and "tree" as the coniferous forest. The description is "These are large pine trees, or some variety of coniferous species. It's hard to really tell, since you are not exactly an arborist." The coniferous forest is in the great forest.

Instead of going nowhere in the great forest:
	say "The trees are too thick to proceed in that direction."
	
Book 3 - Beach and Ocean


Part 1 - Mermaid Beach

Beach N is a room.  "[if the player is in a kayak]You are floating in a kayak at the north end of a nice beach.[otherwise]You are at the north end of a nice beach.[end if] To the west, a vast ocean stretches out before you. The stream from the forest empties into the ocean just north of you. The beach extends to the south." The printed name is "Beach (north end)". It is watery, sandy and near waves. It is west of path by stream. Northeast from beach N is south stream bank.  North of beach N is sand bar.
Instead of going north from Beach N when the player is not in the kayak, say "You could wade across the stream, but the shore on the other side looks to be too covered in vegetation for there to be anywhere for you to go. Maybe there is a place further east where you can wade across the stream."
Instead of going west from Beach N when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."
Instead of going southwest from Beach N when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."
Instead of going northwest from Beach N when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."

Index map with beach n mapped west of path by stream.

Beach S is a room. It is south of beach n. "You are at the south end of a nice beach. A vast ocean stretches out to the west. This end of the beach is surrounded by rocks, blocking all passage except to the north." It is watery, sandy and near waves. The printed name is "Beach (south end)".
Instead of going west from Beach S when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."
Instead of going southwest from Beach S when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."
Instead of going northwest from Beach S when the player is not in the kayak, say "You can't exactly swim across the ocean, you know."
Instead of going nowhere from Beach S when the player is not in the kayak, say "It's too rocky to proceed in that direction."
The rocks are scenery in Beach S. The description is "They are large rocks."

The mermaid carcass is a corpse in Beach S. "[if we have examined the mermaid carcass]The rotting carcass of a mermaid is washed up on the shore here.[else]It looks as though the body of a mermaid has washed up on shore.[end if]". Understand "body" as mermaid carcass. The description is "Yes, closer examination reveals that it is actually the body of a mermaid. The smell is an odd mixture of rotting human flesh and decaying fish matter." The detachable part of the mermaid carcass is the mermaid scale.
After examining the mermaid for the first time:
	say "You notice she is wearing a bracelet.";
	move the power bracelet to beach s;

The rotten canoe is fixed in place in Beach S. The rotten canoe can be overturned. It is overturned. "A canoe in rather poor shape is [if overturned]overturned on the beach[otherwise]beached here[end if]." The description is "The wood making up the canoe has rotted through in a few places, and it looks as thought there might be termites eating away at some parts of it. It will probably never be sea-worthy again."
Instead of pushing the canoe for the first time:
	say "You manage to flip over the canoe. Underneath you see an oar.";
	now the canoe is not overturned;
	move the wooden oar to beach s.
Instead of pushing the canoe:
	say "You flip the canoe over.";
	if the canoe is overturned:
		now the canoe is not overturned;
	otherwise:
		now the canoe is overturned.

Part 2 - By the Stream

Near Land is a room. It is north of sand bar. "You are floating near land, however the land is too rocky and covered with trees to beach your kayak." It is deep watery.
Report going nowhere from near land:
	say "It is too rocky to land." instead.


Part 3 - Town Beach

Town Beach S is north of near land. "Town beach place." The printed name is "Town Beach (south end)". It is watery.

Town Beach N is north of town beach S. "Town beach place." The printed name is "Town Beach (north end)". It is watery.


Part 4 - Ocean

Ocean is a room. It is deep watery. "You are floating in your kayak on a vast ocean. Large waves rock around you, threatening to overturn your boat. [if ocean-x is 0 and (ocean-y < 7 and ocean-y > 0)]Not far to the east you see the mainland. [otherwise]Every once in a while, you can catch a glimpse of the mainland far to the east."

West of beach s is ocean.  West of beach n is ocean. west of near land is ocean. west of town beach s is ocean. west of town beach n is ocean. East of ocean is nowhere.
Index map with room-size of ocean set to 500.

[ x,y coordinates for when we are at sea. y is decreased going north, like coordinates on a monitor. ]
ocean-x is a number that varies.
ocean-y is a number that varies.

Table of Land Locations
x	y	room
1	1	Town Beach N
1	2	Town Beach S
1	3	Near Land
1	4	Sand Bar
1	5	Beach N
1	6	Beach S

Check going when the room gone to is Ocean:
	if the room gone from is not ocean:
		choose a row with room of room gone from in table of land locations;
		now ocean-x is x entry;
		now ocean-y is y entry;
		if the noun is:
			-- north: decrement ocean-y;
			-- south: increment ocean-y;
			-- west: decrement ocean-x;
			-- east: increment ocean-x;
			-- northwest: 
				decrement ocean-y; 
				decrement ocean-x;
			-- southwest: 
				increment ocean-y; 
				decrement ocean-x;
			-- northeast: 
				decrement ocean-y; 
				increment ocean-x;
			-- southeast: 
				increment ocean-y; 
				increment ocean-x;
			
Instead of going when the location is Ocean:
	let disoriented be false;
	if the noun is:
		-- north: decrement ocean-y;
		-- south: increment ocean-y;
		-- west: decrement ocean-x;
		-- east: increment ocean-x;
		-- northwest: 
			decrement ocean-y; 
			decrement ocean-x;
		-- southwest: 
			increment ocean-y; 
			decrement ocean-x;
		-- northeast: 
			decrement ocean-y; 
			increment ocean-x;
		-- southeast: 
			increment ocean-y; 
			increment ocean-x;
	[ confine x,y coordinates to be between the lines y=x and y=7-x, on the left side.]
	if ocean-y < ocean-x:
		now ocean-y is ocean-x;
		now disoriented is true;
	if ocean-y > 7 - ocean-x:
		now ocean-y is 7 - ocean-x;
		now disoriented is true;
	if a random chance of 1 in 6 succeeds, now disoriented is true;
	if disoriented is true:
		say "With the waves pushing you about, you're not sure which direction you're really going.";
	say "x: [ocean-x] - y: [ocean-y] [/l]";
	repeat with N running from 1 to number of rows in table of land locations:
		choose row N in table of land locations;
		if x entry is ocean-x and y entry is ocean-y:
			move the kayak to room entry;
	try looking;


			

Part 5 - Regions

The vast ocean is an outdoors region. beach s, beach n, sand bar, near land, town beach s, town beach n, ocean are in the vast ocean.

The great ocean is a backdrop in the vast ocean. The printed name is "ocean". The description is "It's a vast ocean, and it looks rather unfriendly." Understand "water" as the great ocean.

The ocean shore is a backdrop. It is in beach n and beach s and town beach s and town beach n. The description is "The ocean is very calm, and waves lap gently against the shore. The sound is very soothing." Understand "shore" as the ocean shore. The printed name is "shore".

Book 4 - The mausoleum

Report touching a thing in the mausoleum:
	say "[The noun] is cool to the touch.";
	stop the action.
	
Part 1 - The crypt

The Crypt is a room. It is dark. "This room is definitely a crypt. Given the intricate designs carved into every visible surfaces, you suppose someone rich or important was buried here. Passageways head off to the east, west, north and south."

The large stone sarcophagus is a closed openable enterable container. It is in the crypt. "There is a large stone sarcophagus in the center of the room.  [If the sarcophagus is open]The stone lid of the sarcophagus apparently has been tossed aside by someone or something of great strength, and lies shattered on the floor. 

Inside the sarcophagus you see [list of things in the sarcophagus with indefinite articles].[else]The sarcophagus is covered by a thick stone lid.[end if]". The description is "The sarcophagus is shaped like a coffin, just the right size for holding a large man. It's covered beautiful carvings and designs, the likes of which you've never before. [if the sarcophagus is closed]A thick stone lid covers the sarcophagus.[end if]". Understand "coffin" as sarcophagus. The text description is "The intricate carvings and designs on the sarcophagus are rather beautiful, but you are not sure if it's actually a language of some sort or just artistic."

Instead of opening the sarcophagus when the player is not wearing the power bracelet:
	say "You push on it with all your might, but the stone lid is far too heavy."
Report opening the sarcophagus:
	say "Thanks to your supernatural strength you are able to push the stone lid off the sarcophagus without any trouble. The force of the lid hitting the ground causes it to crack. [/p]Inside the sarcophagus you see [list of things in the sarcophagus with indefinite articles].";
	now the sarcophagus is unopenable;
	stop the action.
	
Instead of closing the open sarcophagus:
	say "The lid is smashed, and there is no way to close it now.";
	
The stone lid is scenery in the crypt. The description is "The lid of the sarcophagus looks to be very heavy. It's probably three inches thick of solid stone. [if the sarcophagus is open]The force of its impact on the ground has cracked the lid of the sarcophagus into two separate pieces."
Instead of taking the stone lid:
	if the player is wearing the power bracelet:
		say "It's far to bulky to carry around.";
	otherwise:
		say "That's way too heavy."
		
The royal skeleton is a corpse inside the sarcophagus. The description is "The skeleton is covered in tattered clothing, which has mostly decayed. What is left of its clothing seems to indicate that this person was once of noble blood. [If the jeweled crown is in the sarcophagus]Of course, the crown that's in there also suggests that.[end if]". The detachable part of the royal skeleton is a dog toy called the royal femur. The initial-durability of the royal femur is 10000. The weight of the royal femur is 8.
The jeweled crown is inside the sarcophagus. 

Part 2 - Treasury

Treasury is a room.  It is east of the crypt. "You are in the treasury of the mausoleum. This is the location where important or sentimental valuables belonging to the deceased would be stored, so that he or she might take them into the next life. However, this room has apparently been ransacked by bandits, and mostly all that is left are bits of paper and broken jars lying about. Shelves line the east, north and south walls, but they are mostly empty. There is a passageway to the west." It is dark. The broken jar bits is scenery in treasury. The description is "You see a bunch of pieces of broken pottery, made from some sort of ceramic material." Instead of taking the broken jar bits, say "That doesn't seem useful." The bits of paper are scenery in treasury. The description is "You see several small torn pieces of paper. Some of them have some writing on them, but there doesn't seem to be anything useful you can do with them."
 
Does the player mean doing something with the broken jar bits: it is very unlikely.
Does the player mean doing something with the bits of paper: it is very unlikely.

Treasury shelves is scenery in Treasury.

A ceramic jar is an open unopenable container in treasury. "Tipped over on the shelves, there is a ceramic jar which appears to be an intact." The description is "It appears to be carefully crafted, and has several pictorial designs painted onto its sides." The carrying capacity of the jar is 2.

The broken ceramic jar is a thing. The description is "This appears to be a recently smashed ceramic jar." It is fixed in place. Instead of taking the broken jar, say "Carrying that around won't do any good."

Part 3 - Pit rooms

Pit Room N is south of the crypt. The printed name is "Pit Room (north side)". "You are in a room with a deep gaping pit. The pit is rectangular in shape, running east-west and cuts the room in two. The air here is significantly cooler than in the rest of the mausoleum. To the south across the pit is the other half of the room, and to the north is the passage back to the crypt." It is dark.
Every turn when the location is the pit room and the chosen quest is not lich-quest:
	if the player carries the brass lantern and the brass lantern is lit and a random chance of 1 in 12 succeeds:
		say "A black wind passes through the room, sending a shiver down your spine. Your lantern goes out.";
		now the lantern is switched off;
		now the lantern is unlit;
	otherwise if a random chance of 1 in 5 succeeds:
		say "A spooky voice whispers, 'turn back, mortal creature.' You feel chilled."

Before going south in the pit room:
	if not in darkness, say "You leap over the pit..."
[
Instead of going south in the pit room:
	say "As you leap over the pit, a black wind blows up from the depths, knocking you back to the north.";
	if the brass lantern is in the room and the brass lantern is lit:
		say "The lantern goes out.";
		now the brass lantern is switched off;
		now the brass lantern is unlit.
]		
Instead of going south in the pit room when in darkness:
	say "It turns out that there is a big, gaping pit somewhere in this room, but without any light you don't find out about it until you are in freefall. The good news is that it's not one of those bottomless pits. The bad news is that it's a long way to the bottom.";
	end the story.

Pit Room S is south of Pit Room N. The printed name is "Pit Room (south side)". "You are in a room with a deep gaping pit. The pit is rectangular in shape, running east-west and cuts the room in two. To the north across the pit is the other half of the room. It's rather cold here. You see a stairway leading down into the depths of the mausoleum."


Before going down in pit room s:
	say "You climb down the stairs."
Before going north in pit room s:
	say "You leap over the pit..."
	
There is a backdrop called pit in Pit room n and Pit room s. The description is "It's a very deep pit, running east-west cutting the room in two. It even cuts through the walls. You can't see the bottom, but it looks narrow enough to jump across it."

Instead of jumping into the pit, try entering the pit.
Instead of entering the pit:
	if the player is carrying Atari:
		say "If you're going to commit suicide, at least have the decency not to bring the dog with you!";
	otherwise if the player is wearing the crown:
		say "It turns out the pit isn't bottomless, but it *is* a very long way to the bottom. But for some reason, you manage to land unharmed.";
		move the player to bottom of the pit;
	otherwise:
		say "It turns out the pit isn't bottomless, but it *is* a very long way to the bottom.";
		end the story.
		
Instead of jumping over the pit in pit room:
	try going south.
Instead of jumping over the pit in pit room s:
	try going north.
	
Instead of inserting something into the pit:
	try throwing the noun at the pit.
	
Instead of throwing something at the pit:
	say "You toss [the noun] into the pit. You wait a while, but you never hear it hit the bottom. Well, hopefully you didn't need [the noun] for anything.";
	if the noun is the ceramic jar:
		remove the noun from play;
		move the broken jar to the Bottom of the Pit;
	otherwise:
		move the noun to Bottom of the Pit.
	
Bottom of the Pit is a room. "You are at the bottom of a deep pit, shaped like a long rectangle. The walls around you are steep and smooth; there is no chance of climbing back up. There are various bones strewn about here." 

A piece of parchment is a piece of paper in bottom of the pit. "An old withered piece of parchment paper lies on the floor here." The description is "It's a very old piece of parchment paper. The writing on it is delicate, and looks as though it was done with a fountain pen." 
The text description is "The text reads: [/p]The crown and scepter are far too powerful to fall into the wrong hands. As I have no son, I fear that those who follow in my footsteps may not share my vision for this country. As such, I have had a fake crown crafted for my successor and decided that the true crown is to be buried with me. The scepter has already been given to my trusted friend and advisor Captain Neckbeard, so that he may hide it in a far away land. I will write here, as the only copy, the means to operate the scepter, in hopes that one day a true ruler of the land may emerge and use it to lead the people into the prosperity they deserve. [/p]The operation of the scepter is simple. One need only point it at one's enemy and utter the words 'klaatu barada nikto' and the enemy will be incinerated. Take care however, that the crown is worn at the same time, otherwise the feedback from the scepter will be too much to stand. [/p]It is with great regret that I write this. I was not able to achieve the prosperity of my kingdom that I had hoped for. The medics tell me nothing can be done about debilitating disease I have contracted. No magic seems to help, and even the crown does not stop the effects. I am nearing my end. I am only thankful that I shall not live to see my kingdom undone by those bickering fools who vie for my throne. I shudder to think of the chaos that will ensue once I am gone and the throne is left without an heir. [/p]His Majesty, [/l]Dalton";

[
klaatu barada nikto is a magic-spell.

After reading the parchment:
	now klaatu barada nikto is learned;
	continue the action.
]
Index map with bottom of the pit mapped east of pit room N.

Part 4 - Lich Room

Undead Throne Room is a room. "You are in a large room with a throne[if the lich is in the location] on which a strange figure sits,[otherwise] at the end of the room opposite the stairs.[end if] [if the lich is in the location]The air here is freezing. You're not sure if it's really the temperature or the presence of the shrouded figure on the throne.[end if]"

Crypt stairway is a door. It is down from pit room s and up from Undead Throne Room. The printed name is "stairway". Understand "stairs" as crypt stairway. It is open and unopenable and scenery. It is not proper-named.

Instead of entering Crypt stairway in Undead Throne Room, try going up.
Instead of entering Crypt stairway in pit room s, try going down.
Instead of going north from Undead Throne Room, try going up.

There is a scenery enterable supporter called the grave throne in undead throne room. The description of grave throne is "[if the lich is in the location]The lich is sitting on a high-backed chair that appears to be constructed out of bone. You don't really feel comfortable getting closer for a more thorough examination.[otherwise]The throne is a high-backed chair that is constructed out of bone. Even without the lich here, the chair gives off a very creepy feeling.[end if]".
Before entering the undead throne in the presence of the lich:
	say "I don't think [the lich] wants you sitting on its lap." instead.
	
The lich is here.

Part 5 - Burial chamber

Burial Chamber is north of crypt. "You are in a burial chamber which contains several bodies, probably relatives, friends, or faithful servants of whomever is entombed in the crypt."

Part 6 - Mausoleum Entry

Mausoleum Entry is west of the crypt. "You are in the entryway of a mausoleum. The air here is significantly cooler than outside. To the west you see a stairway leading up into daylight. East goes deeper into the crypt."

Instead of an actor going up in mausoleum entry, try the actor going outside.
Instead of an actor going west in mausoleum entry, try the actor going outside.

Instead of going west in mausoleum entry, try going outside.
Instead of going up in mausoleum entry, try going outside.

Part 7 - Region

There is a region called the Mausoleum. Mausoleum is indoors. Treasury, the crypt, burial chamber, the mausoleum entry, pit room n, pit room s, undead throne room, bottom of the pit are in the mausoleum.
 
The mausoleum walls are a backdrop in the mausoleum. The description is "The walls are constructed out of stone. There are a few cracks here and there, but overall they look very sturdy."

Book 5 - Wizard's Tower

Part 1 - Friendly Rooms

Chapter 1 - Outside

There is a room called Outside the Tower. Outside the Tower is south of creepy forest path. "You stand at the base of a large stone tower. The woods surround you in all directions, except for the lone path going to the north." It is in the great forest.

Chapter 2 - The den

Tower Den is a room. "You are inside a lavish den, furnished with immaculate furniture and rugs. A fire burns in a fireplace on the west wall. There is a wonderful smell in the room, like a mixture of the aromas of hazelnuts and almonds." 

A brown luxury recliner is scenery in tower den. "The recliner looks to be well used by someone who loves to sit in it and read books for hours upon end."
The wizard is here.

A beautiful woven rug is scenery in tower den. "There is a large woven rug on the floor here. It is covered with many vibrantly colored designs of such intricate detail that you wonder how many years it took someone to create it."

A fireplace is scenery in tower den. "The fireplace is made from what looks to be large river rocks, mortared together and shaped by an expert craftsman. A fire blazes within, consuming the wood fuel placed inside."

Instead of going up from tower den, say "Remarkably, although you are in the bottom of a tall tower, there doesn't seem to be any way to go up."
Instead of going north from tower den, try going outside.

tower door is a door. It is inside from outside the tower and outside from tower den. It is scenery. It is not proper-named.

Part 2 - Unfriendly Rooms


Part 3 - Region

The Wizard's Tower is a region. tower den is in the wizard's tower.

Book 6 - Town

Town square is a room. It is north of north stream bank. West of town square is town beach s.

Book 7 - Castle

The castle is a backdrop.

Volume 4 - Start up

The weather is clear.
Atari is in west field.

When play begins:
	say "It's the strangest thing. You came to stay at your grandfather's house for a month during summer vacation, and two weeks ago while you were out watering the lawn your grandfather disappeared from inside the house and you haven't seen him since. The house is not large, and there is no back door. He's a fairly fit individual for his age, but there is no real reason to suspect that he went out through a window. You filed a missing persons report with the local police department but they have not managed to come up with anything yet either. While wandering through the house, you managed to find a trap door under the stairs, and upon entering you find yourself in..."
	