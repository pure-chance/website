#import "../../template/article.typ": article

#show: article.with(
  uri: "optimally-wrong-wordle",
  title: "Optimally Wrong Wordle",
  subtitle: "The quest for the worst Wordle player.",
)

= Problem Statement
In standard Wordle, players attempt to identify a hidden five-letter word within six guesses, receiving feedback after each attempt regarding letter correctness and positioning. This project inverts that objective: find _all_ possible combinations of one answer word and six guess words where the guesses provide zero information about the answer. Formally, the problem can be stated as follows: Find all 7-tuples $S = \(a, g_1, g_2, g_3, g_4, g_5, g_6\)$ where $a in A$ and $g_i in G$ for $i in {1, 2, 3, 4, 5, 6}$, such that all words $w in S$
are pairwise disjoint with respect to their constituent letters. $A$ is the set of answer words and $G$ is the set of guess words.

This problem is a clique problem, which are computationally hard, as in NP-hard. With $|A| = 2,331$ and $|G| = 10,657$, it's going to take a very carefully optimized algorithm to solve this in any reasonable amount of time.

= Signatures

The first optimization that we can make is to use bitsets to represent each word. Consider that for this problem, the only thing that matters is whether a word contains a given letter. There are 26 possible letters, and a `u32` has 32 bits. So we can represent each word as a `u32` where each bit represents whether the word contains the corresponding letter. This allows us to quickly check if two words share any letters by performing a bitwise AND operation and comparing the result to zero (e.g., `a & b == 0`).

This also has nice secondary benefits, like being able to quickly union sets of words by performing bitwise OR on their bitsets (e.g., `a | b`).

Another critical realization is that many guesses have the same signature. So instead of checking each of the 10,657 guesses, we can deduplicate them and only check the 6,655 unique guess signatures. We also apply this to the answers, which have 2,331 unique signatures.

This means that after we _pack_ the signatures, we need to _realize_ these "signature" solutions back into all the Wordle solutions that could have produced this packing. Packing and realization are performed sequentially, and will be discussed in more detail in the next sections.

= Packing

Packing happens in 3 steps (for each deduplicated answer signature in parallel): find all triples, partition triples, and scan-and-merge partitions.

+ _Find Triples_---We want to find all disjoint triples for some answer signature. To do this, first we filter out all guesses which are already disjoint with the answer. From this reduced guess set, we iterate all triples and check that the 3 guesses are disjoint. A nice and simple optimization is to skip trying to make a triple if the first two are already disjoint.

+ _Partition Triples By Signature_---At this point, we have tens of millions of triples, so we can't just check all pairs in reasonable time. Instead, we partition triples by their union with some partition, and then we can only check a small subset of triples, skipping many non-disjoint triples. From experimental results, we've found that the optimal signature to partition by is the top ten letters _"seaoriltnu"_.

+ _Scan and Merge Partitions_---Finally, we iterate each pair of partitions. If the partitions keys are not disjoint, then we know that all pairs of triples from these partitions are not disjoint. If the two partition keys, then check each pair of triples from these partitions, creating a packing if the two triples are disjoint.

= Realization

After packing, the core computational problem is done. But the solution are are all combinations of signatures, not of words. And as we know, the process of converting words to signatures is not injective. So for each packing, there are potentially multiple different combinations of words which could you produced it. In realization, we do exactly this. For each packing, we collect all possible combinations of words which would have generated this packing. This is done by creating a lookup table with signatures as keys and their corresponding words as values. This is precisely the inverse function of word to signature. Then for a given packing, we collect the multi-cartesian product of all words for each signature in the packing. This is done for each packing, the set of unique such solutions are our goal.

= Results

Our findings tell us that there are 565,783 packings, and 1,122,348 solutions.

= References

The original inspiration for this project is #link("https://www.youtube.com/watch?v=zoh5eLOjwHA&t=156s")[You should play Wordle wrong] by Ellie Rasmussen. You can read my full source code at #link("https://github.com/pure-chance/optimally-bad-wordle")[pure-chance/optimally-bad-wordle].
