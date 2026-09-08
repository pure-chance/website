#import "../../template/page.typ": page

#show: page.with(
  uri: "about",
  title: "pure-chance",
  description: "About @pure-chance.",
  label: "About",
)

Hello, I'm Chance. I studied statistics, which is to say I spent several years thinking carefully about uncertainty and then immediately applied none of that to my life choices. This site is where I write about things---math, computer science, linguistics, anything that matters to me enough to write about.

Some of this finds its way into projects, usually the kind that start as a simple question before quickly becoming rabbit-holes of their own. Here are a few favorites:

- _Greed_---Greed is a two-player dice game. The objective is to get closer to the maximum, without exceeding it. The rules are as follows: each player rolls any number of dice. The sum of the dice is added to the player's score. This continues back and forth until a player either exceeds the maximum score (busts), or chooses to stop rolling. When a player chooses to stop, the other player gets one more turn. I wrote a solver that computes the optimal strategy for each player.

- _Wrong Wordle_---In Wordle, typically you want to guess the word. In Wrong Wordle, you don't even want to guess a single letter. I wrote a program that finds all optimally bad Wordle games. Formally, what this means is finding all pairs of answer + 6 unique guesses which share no letters in common.

- _Kingmaker_---My undergraduate thesis project, which simulates strategic voting under a set of adjustable social conditions.

I also occasionally go outside, often for adventures with my dad (love you dad). We've been on many a wild adventure together: road trips across the country, 24 hour death marches from the Golden Gate Bridge to our house, the legendary Jackass Trip, and more. Allow me to give you a glimpse into what it's like to hike with my dad.

My dad and I are out on a multi-day hike to the ocean. On our journey, we hike up and over our local mountain, Mount Tam. But we've never been on this exact path before, we only know that we need to take a left somewhere. So we do---straight into a watercourse (which is not a trial, I remind you). So it's been maybe 10 minutes. It's becoming clear that this it _not_ the trial. Turning back now would be sensible; this is not what we do.

Instead, we continue, climbing directly up the hill, over dead logs and through the brush. This is where, unfortunately, we beloved jacket is lost (it is missed). Somehow, along the way is a 30 foot waterfall that we have to scramble around. It's about this point that we realize that we have no idea where we are, and no idea where to go.

Miraculously, there is just enough cell service to get gps and pretend we know where we need to go. After much bumbling around, we stumble upon a fire trial. Victory.

This is what we call the _unconventional path_. When you hike with my dad, you will experience this often.

Along with hiking / backpacking, I'm also an avid climber, both in the gym and on the rock. Truly, there's nothing quite like hanging off a single bolt, thinking to yourself, "If this sling snaps, I'm going to tumble right into a story in the _Accidents in North American Climbing_... I knew I should have taken that other sling."

#html.hr()

If you'd like to contact me, you can find me on #link("https://bsky.app/profile/pure-chance.xyz")[Bluesky] and #link("https://github.com/pure-chance/")[GitHub], or you can #link("mailto:chance.h.addis@proton.me")[email] me (good luck though).
