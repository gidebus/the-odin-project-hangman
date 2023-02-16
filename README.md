# the-odin-project-hangman
Curriculum project hangman from The Odin Project. It is a CLI version of the the hangman game utilizing JSON serialization to save games and continue them at a later time.


To start the game navigate to the main folder and run:
```
ruby ./bin/hangman
```

to run `rspec` tests navigate to the main folder and run:
```
rspec
```

Future iterations of this program will include better tests, such as integration tests fo the `Game` class. Better user experience prompts such as checking for already existing saved games etc.. Rescue failures for unwanted or unformatted responses from users, and refactoring of the `Game` class into other classes such as a `Serializer` class, a `Manager` class that saves and loads games, and better delegation of reading to the `Reader` class and writing files to a `Writer` class.