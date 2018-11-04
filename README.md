
Hey y'all, I built the specs as best as I could but I didn't know how to test two things, so I left them pending. Good luck, tell me what you think :)

# War

## Rules

* You have **1 hour** for the assessment. Do not worry if you do not
  complete all the assessment; finish as much as you can.
* Descriptions of each method to implement are written into the `lib/`
  files. For each `lib/` file, there is a corresponding `spec/` file.
* Run the specs as you solve the assessment. Solve the assessment in
  this order:

```
bundle exec rspec spec/card_spec.rb
bundle exec rspec spec/deck_spec.rb
bundle exec rspec spec/player_spec.rb
bundle exec rspec spec/war_spec.rb
```

* Wait until you finish to run `rspec spec`, which will run all the
  tests. Do this as a final check that you have them all passing.

## Game Rules

The goal is to win ALL the cards leaving your opponent with none.

0. Players are each dealt half the deck in an alternating pattern.
1. Players each take their top card and lay it face UP.
2. If the cards' rank is the same i.e. 3 of clubs and 3 of hearts,
   players take ANOTHER card and lay it face DOWN, then repeat step 1.
3. If the last drawn cards are different ranks, all the cards drawn in
   this round are awarded to the drawer of the higher ranked card.
4. If either player runs out of cards at any time, that player loses
   and the game ends.
