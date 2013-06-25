Characterization of Good/Bad Orbigraphs
=======================================

Definitions needed:
Markov chain
Stationary distribution
Limiting distribution
Irreducible markov chain
Reversibility
Thoughts:
Can we make the minimal construction more natural in the proof?
Can we prove this with HOL light or some other automatic proof verifier?
Is the business about the equivalence between the markov pillar and the tree pillar clear?
Is it necessary or just obvious?
**Claim**:
A k-orbigraph $\mathcal{O}$ has a finite k-regular cover with equitable partition if and only if, when converted to a Markov chain, $\mathcal{O}$ is reversible.

**Proof**:
We start with the first direction: if $\mathcal{O}$, when converted to a Markov chain, is reversible, then $\mathcal{O}$ has a finite k-regular cover. Let $\mathcal{M}(\mathcal{O})$ denote the Markov chain, associated with orbigraph $\mathcal{O}$, which can be constructed by simply normalizing the rows of the adjacency matrix of $\mathcal{O}$ by $k$. Let $P$ be the stochastic transition matrix of $\mathcal{M}(\mathcal{O})$ and $P_{i,j}$ denote the probability of moving from 

If $\mathcal{M}(\mathcal{O})$ is reversible, then by definition, there exists a stationary distribution $\pi$, such that for any two states $i$ and $j$, $\pi$ satisfies the $\textit{detailed balance equation}$:

$$
\pi_i P_{i, j} = \pi_j P_{j, i}
$$

We will use this equality to produce a finite k-regular cover for $\mathcal{O}$. We start by "denormalizing" $P_{i,j}$ and $P_{j, i}$ by multiplying both sides of the quality by $k$ giving us the following:

$$
\pi_i A_{i, j} = \pi_j A_{j,i}
$$

where $A$ is the integer-valued adjacency matrix of the original orbigraph $\mathcal{O}$. Next, we "denormalize" $\pi_i$ and $\pi_j$. We know that every reversible Markov chain can be represented as a walk on some undirected graph (boyd) so that the stationary distribution becomes $\pi_i = \frac{W(i)}{W}$ where $W(i)$ is the total outgoing edge weights from vertex $i$ (in the undirected graph) and $W$ is the total outgoing edge weights. In short, $\pi_i$ is rational and every entry of $\pi$ shares a common denominator. Thus, we "denomalize" $\pi_i$ and $\pi_j$ to new integer values $d_i$ and $d_j$.

$$
d_i A_{i, j} = d_j A_{j, i}
$$

We wish to construct a k-regular graph $\mathcal{C}$ with an equitable partition which, when quotiented, produces $\mathcal{O}$. We can use the information in the detailed balance equation to construct a valid cover.

For any two partitions $i$ and $j$ where $i \neq j$, we place $c d_i$ vertices in partition $i$ and $c d_j$ vertices in partition $j$. The detailed balance equation thus becomes:

$$
(c d_i) A_{i, j} = (c d_j) A_{j, i}
$$

In order for $\mathcal{C}$ to properly quotient to $\mathcal{O}$, every vertex in partition $i$ must connect to $A_{i, j}$ vertices in partition $j$ and vice versa for vertices in $j$. In other words, $A_{j, i}$ should divide the total number of vertices in partition $i$ and vice versa for $A_{i, j}$ and partition $j$. Thus, we choose $c$ such that $A_{j, i} | c d_i$ and $A_{i, j} | c d_j$. 

The detailed balance equations ensures that partition $i$ and partition $j$ share the same number of total "outgoing" edges; we need only choose $c$ to guarantee an equitable distribution of edges within the partitions.

Next we handle the case where $i = j$: connections within a partition. Every partition $i$ requires a multiple of $A_{i, i} + 1$ vertices since each vertex in $i$ must connect to $A_{i, i}$ other vertices. Thus, we choose $c$ such that $(A_{i, i} + 1) | c d_i$. 

Overall then, we choose $c = LCM(\lbrace A_{i,j} | i \neq j \text{ and } A_{i, j} \neq 0 \rbrace \cup \lbrace A_{i, i} + 1 | i = j \text{ and } A_{i, i} \neq 0 \rbrace)$.

This construction produces a k-regular cover with an equitable partition that quotients to $\mathcal{O}$. To ensure it is connected, one can swap edges between partitions $i \neq j$. Additionally, the construction can be made minimal if $c$ is chosen to be a multiple of $A_{i, i} + 1$ and $A_{i, j}$ only when $d_i$ is $\textit{not}$.

For the other direction, assume that $\mathcal{O}$ has a finite k-regular cover $\mathcal{C}$ with an equitable partition $P = \lbrace P_1, \ldots, P_n \rbrace$. We wish to show that $\mathcal{M} ( \mathcal{O} )$ is reversible. 

We first convert $\mathcal{C}$ into a Markov chain $\mathcal{M} ( \mathcal{C} )$, modeling a random walk on $\mathcal{C}$ using the construction outlined in [boyd]. For each pair of vertices $i, j$ where $i \neq j$, we add a directed edge to our Markov model with $p_{i, j} = \frac{1}{k}$ where $p_{i, j}$ is the probability of transitioning from state $i$ to state $j$. Of course, since  $\mathcal{C}$ is undirected, we will produce pairs of directed edges for each $i, j$. As [boyd] highlights, $\mathcal{M} (\mathcal{C})$ is reversible.

Using the equitable partition $P$ and applying the Markov lumping process described in [boyd], the "lumped" chain is Markovian and has one state for each partition $P_i$. Furthermore, the lumped transition probabilities become $\tilde{p}_{i, j} = \sum_{k \in P_j} p_{i, k}$ so that $\tilde{p}_{i, j} = |P_i| \frac{1}{k}$. 

This "lumped" chain is identical to $\mathcal{M} ( \mathcal{O} )$ which is obtained by first quotienting the k-regular covering $\mathcal{C}$ and then normalizing the edge weights by $k$. In other words, we need only show that if $\mathcal{M} (\mathcal{C} )$ is reversible, then the "lumped" chain, which is identical to $\mathcal{M} ( \mathcal{O} )$, is also reversible.

By definition of lumping, we know that each partition in $P_i$ corresponds to a vertex in $\mathcal{M} ( \mathcal{O} )$ and that $P_i$ is independent of choice of $i$ because $P$ is equitable. Choose $\tilde{ \pi }_{P_i} = \sum_{k \in P_i} \pi_k$ and let $A$ be the transition matrix for $\mathcal{M} ( \mathcal{C} )$ and $\tilde {A}$ for $\mathcal{M} ( \mathcal{ O } )$. This choice of $\tilde{ \pi }$ makes $\mathcal{M} ( \mathcal{O} )$ reversible:

$$
\begin{align}
	\tilde{ \pi }_{P_i} \tilde{A}_{P_i, P_j} &= \sum_{k \in P_i} \pi_k A_{k, P_j} \cr
							&= \sum_{k \in P_i} \sum_{\mathcal{l} \in P_j} \pi_k A_{k, \mathcal{l} } \cr
							&= \sum_{k \in P_i} \sum_{\mathcal{l} \in P_j} \pi_{ \mathcal{l} } A_{\mathcal{l}, k} \cr
							&= \sum_{k \in P_i} \pi_{P_j} A_{ \mathcal{l}, k } \cr
							&= \pi_{P_j} \tilde{A}_{P_j, P_i}
\end{align}
$$

Hence, $\mathcal{M}( \mathcal{O} )$ is reversible if $\mathcal{M} ( \mathcal{C} )$ is reversible.