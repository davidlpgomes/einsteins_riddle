include "alldifferent.mzn";


% enums
enum Houses = { First, Second, Third, Fourth, Fifth };
enum Nationalities = { British, Danish, German, Norwegian, Swedish };
enum Colors = { Blue, Green, Red, White, Yellow };
enum Pets = { Birds, Cats, Dogs, Fish, Horses };
enum Drinks = { Beer, Coffee, Milk, Tea, Water };
enum Hobbies = { Baseball, Basketball, Piano, Soccer, Violin };


% vars
array[Nationalities] of var Houses: ns;
array[Colors] of var Houses: cs;
array[Pets] of var Houses: ps;
array[Drinks] of var Houses: ds;
array[Hobbies] of var Houses: hs;


% constraints
constraint alldifferent(ns);
constraint alldifferent(cs);
constraint alldifferent(ps);
constraint alldifferent(ds);
constraint alldifferent(hs);

% 1. The British man lives in the red house.
constraint ns[British] = cs[Red];

% 2. The Swedish man keeps dogs as pets.
constraint ns[Swedish] = ps[Dogs];

% 3. The Danish man drinks tea.
constraint ns[Danish] = ds[Tea];

% 4. The German plays soccer.
constraint ns[German] = hs[Soccer];

% 5. The green house's owner drinks coffee.
constraint cs[Green] = ds[Coffee];

% 6. The owner who plays baseball has birds.
constraint hs[Baseball] = ps[Birds];

% 7. The owner who plays basketball lives
%    next to the one who keeps cats.
constraint hs[Basketball] = ps[Cats] - 1 \/ hs[Basketball] = ps[Cats] + 1;

% 8. The Norwegian lives in the first house.
constraint ns[Norwegian] = First;

% 9. The owner who plays the violin drinks beer.
constraint hs[Violin] = ds[Beer];

% 10. The owner of the yellow house plays the piano.
constraint cs[Yellow] = hs[Piano];

% 11. The owner living in the center house drinks milk.
constraint ds[Milk] = Third;

% 12. The owner who keeps the horse lives next
%     to the one who plays the piano.
constraint ps[Horses] = hs[Piano] - 1 \/ ps[Horses] = hs[Piano] + 1;

% 13. The green house is on the immediate left of the white house.
constraint cs[Green] = cs[White] - 1;

% 14. The Norwegian lives next to the blue house.
constraint ns[Norwegian] = cs[Blue] - 1 \/ ns[Norwegian] = cs[Blue] + 1;

% 15. The owner who plays basketball lives next to the one who drinks water.
constraint hs[Basketball] = ds[Water] - 1 \/ hs[Basketball] = ds[Water] + 1;

output [
    show(hn) ++ ": " ++ show(n) ++ ", " ++
    show(c) ++ ", " ++ show(p) ++ ", " ++
    show(d) ++ ", " ++ show(h) ++ "\n"
    | hn in Houses,
      n in Nationalities where fix(ns[n]) == hn,
      c in Colors where fix(cs[c]) == hn,
      p in Pets where fix(ps[p]) == hn,
      d in Drinks where fix(ds[d]) == hn,
      h in Hobbies where fix(hs[h]) == hn
];

output [
    "\nThe owner of the fish is the " ++ show(n) ++ " man.\n"
    | n in Nationalities
      where fix(ns[n]) == fix(ps[Fish])
];

solve satisfy;
