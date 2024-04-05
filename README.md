# Einstein's Riddle
An Einstein's riddle solution implemented with CSP ([Constraint satisfaction problem](https://en.wikipedia.org/wiki/Constraint_satisfaction_problem)) and [MiniZinc](https://www.minizinc.org).

## Problem
There are five houses in a row and each house is a different color. A different man lives in each house and is from a different country. Each person drinks a certain drink, has a certain hobby, and keeps a certain pet. No two people drink the same drink, have the same hobby, or raise the same pet.

Use the following 15 facts to determine: **"Who owns the fish?"**

1. The British man lives in the red house.
2. The Swedish man keeps dogs as pets.
3. The Danish man drinks tea.
4. The German plays soccer.
5. The green house’s owner drinks coffee.
6. The owner who plays baseball has birds.
7. The owner who plays basketball lives next to the one who keeps cats.
8. The Norwegian lives in the first house.
9. The owner who plays the violin drinks beer.
10. The owner of the yellow house plays the piano.
11. The owner living in the center house drinks milk.
12. The owner who keeps the horse lives next to the one who plays the piano.
13. The green house is on the immediate left of the white house.
14. The Norwegian lives next to the blue house.
15. The owner who plays basketball lives next to the one who drinks water.

## Output
Running the **riddle.mzn** file with MiniZinc, the output is:

    First: Norwegian, Yellow, Cats, Water, Piano
    Second: Danish, Blue, Horses, Tea, Basketball
    Third: British, Red, Birds, Milk, Baseball
    Fourth: German, Green, Fish, Coffee, Soccer
    Fifth: Swedish, White, Dogs, Beer, Violin

    The owner of the fish is the German man.
