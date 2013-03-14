Facebook hiring sample test
===========================

There are K pegs. Each peg can hold discs in decreasing order of radius when looked from bottom to top of the peg. There are N discs which have radius 1 to N; Given the initial configuration of the pegs and the final configuration of the pegs, output the moves required to transform from the initial to final configuration. You are required to do the transformations in minimal number of moves.

A move consists of picking the topmost disc of any one of the pegs and placing it on top of anyother peg. At anypoint of time, the decreasing radius property of all the pegs must be maintained.

Constraints
-----------

    1<= N<=8
    3<= K<=5

Input Format
------------

    N K
    2nd line contains N integers. Each integer in the second line is in the range 1 to K where the i-th integer denotes the peg to which disc of radius i is present in the initial configuration. 3rd line denotes the final configuration in a format similar to the initial configuration.

Output Format
-------------

    The first line contains M - The minimal number of moves required to complete the transformation. 
	The following M lines describe a move, by a peg number to pick from and a peg number to place on. If there are more than one solutions, it's sufficient to output any one of them. You can assume, there is always a solution with less than 7 moves and the initial confirguration will not be same as the final one.


Sample Input #00
----------------

    2 3
    1 1
    2 2

Sample Output #00
-----------------

    3
    1 3
    1 2
    3 2

Sample Input #01
----------------

    6 4
    4 2 4 3 1 1
    1 1 1 1 1 1

Sample Output #01
-----------------

    5
    3 1
    4 3
    4 1
    2 1
    3 1


Explanation
===========================

The wording of this problem is extremely difficult without visuals. When I first read this, I had absolutely no clue how to tackle the problem, especially without ever seeing a "Tower Of Hanoi". The key point to highlight in the question is "Each integer in the second line is in the range 1 to K where the i-th integer denotes the peg to which disc of radius i is present in the initial configuration". Chant that 3 times before looking at the visualisation below.

Sample Input #00 looks like this:

	 |   |  |
	-1-  |  |
	-2-  |  |
	
Sample Output #00 looks like this:

	 |   |   |
	 |  -1-  |
	 |  -2-  |

And Sample Input #01 looks like this:

	 |   |   |   |   |   |
	-5-  |   |  -1-  |   |
	-6- -2- -4- -3-  |   |
	
Sample Output #01 should look like this:

     |   |   |   |   |   |
     |   |   |   |   |   |
    -1- -2- -3- -4- -5- -6-

Voila

Imagine every node as a possible configuration of pegs & discs, with the root node as the initial configuration and the end node as the solution. Every edge is counted as a move with equal cost. We  create moves (and nodes) as we check each possible solution breadth first, by moving one disc. 


