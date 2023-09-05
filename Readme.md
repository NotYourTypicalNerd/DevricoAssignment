Quick outline on the Project:
-SQLite DB embedded in the solution. Should run without issues
- Created with VS Studio 2022 Community Edition
- API: .Net Core
- Class Library: .Net 7

I have always heard about roulette, but never bothered to find out the rules. Since the requirements for this task where not very detailed, 
I have made a few assumptions:
	1. There is a fixed number of Roulettes(4). There is no endpoint to add more.
	2. Same with players
	3. Only bets I will focus on are "Straight Ups". Would have loved to do Outside Bets/Splits but I dont think it is important for this role. Glad to do it if you
	   believe it necessary though.

Basically, my thinking is:
	1. Get Roulette ID by using the 1st endpoint in the controller(url there)
	2. Get Player Id using the necessary endpoint
	2. Create a game(should return you ID)
	3. Create a bet

Notes: I have implemented some OOP and singletons patterns. As such, I was not worried much about what is "outstanding" especially as I had no spec to work with.
I will be happy to make any further changes if you think I still need to do more but it was hard working off of blind faith without proper spec.

Regarding project structure, I would usually separate Domain from models as Libraries for database access can be reused in multiple projects, but I thought that was 
an overkill solution for this project. Please also note comments throughout the code.

To be honest, I should have used EntityFrameWork for this. It was my first time with Dapper so I figured why not try it? Would have developed faster with EF though.

Feel free to let me know if there is anything else you need.