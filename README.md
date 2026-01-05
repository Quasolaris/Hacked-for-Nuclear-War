# Hacked for Nuclear War 1.0

You are a captain of a nuclear submarine that is on station somewhere in the depth of the sea. Armed with [SLBMs](https://en.wikipedia.org/wiki/Submarine-launched_ballistic_missile) you are responsible for your nations deterrence and lasting peace on earth. When you get the orders to launch a counter strike, strange things happen to your Submarine Command System (SCS), soon you realize that your submarine was hit by a cyber attack. You need to dive and investigate who is responsible and how to restore your ship to full functionality.

<p align="center">
<img width="557" height="392" alt="image" src="https://github.com/user-attachments/assets/938840ec-f3f0-4018-b93e-4361d12cc5bf" />
</p>


*Hacked for Nuclear war* is a little game written in Bash, that makes you investigate simple logs in search for Indicators of Compromise (IoC) that you get from the [MITRE | ATT&CK](https://attack.mitre.org/groups/) collection. The submarines attacker, nation, logs and general behaviour of the systems is randomly generated for every play-through, and you will have multiple endings that are triggered through your actions.

## Installation
1. Clone the repository to your machine `git clone https://github.com/Quasolaris/Hacked-for-Nuclear-War.git`
2. Install [MPV](https://mpv.io/). This is an open source command-line media player used to play sounds in the game.
3. *OPTIONAL* install [glow](https://github.com/charmbracelet/glow) with the package manager of your choice
	- The script detects if you have glow installed, if not it will default to the `less` command.
4. Run the game inside the cloned folder:
	- `cd Hacked-for-Nuclear-War`
	- `bash hacked_for_nuclear_war.sh`

The game was tested on the following platforms, but as it is plain bash it should work on every system that has Bash installed (Windows can use WSL):

- Linux
- FreeBSD
- Android (Termux)

## Hints for less experienced Bash users
- When you read documentation or log files inside the game, you are using `glow` or `less`. This means you can use some commands that you maybe also know from the `man` pages:
	- Use the Up and Down Arrow keys to scroll
	- Type `/` and then write a word you want to search for (Case-Sensitive) then press ENTER. You can now cycle through the findings with `n` (next word) and `b` (before word).
	- Hit `q` to exit the documentation or log view.
- To exit the game hit `CTRL+C`.
