Word Ladder Problem
===========================

A word ladder is an interesting puzzle. Invented in 1878 by Lewis Carroll, the author of Alice in Wonderland. In this kind of puzzle you must change one character at a time to transform one word into another.

Consider this: how can we transform the word "POOL" into the word "SAGE"? The only constraints are we must only use real dictionary words, and that word length is constant (assumed):

	pool
	cool 
	coal 
	foal 
	foil 
	boil 
	bail 
	hail 
	hall 
	call 
	calf 
	caff 
	cafe 
	safe 
	sage

Solution
--------

We do this by performing a set of transformations to the letters to find the most efficient path from the starting word to the resultant word. 

By using wildcards, we can significantly reduce our search space:

For e.g. "rope" "hope" "cope" are treated as "_ope". "pope" "pole" are treated as "po_e"

We call these "buckets". The reason being is that they interconnect two words by a one character transformation. "pope" is to "pole" where p->l. This represents not only a huge reduction in the search space an algorithm needs to handle, it also helps us transfer this easily into a node/edge graph problem. When we create the buckets are we effectively creating adjacency lists for a graph. 

Bon Appetit