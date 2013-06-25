Characterization of Good/Bad Orbigraphs
=======================================

Definitions needed:
Markov chain
Stationary distribution
Limiting distribution
Irreducible markov chain
Reversibility
Can we prove this with HOL light?

**Claim**:
A k-orbigraph $\mathcal{O}$ has a finite k-regular cover if and only if, when converted to a Markov chain, $\mathcal{O}$ is reversible.

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

This construction produces a k-regular cover with an equitable partition that quotients to $\mathcal{O}$. To ensure it is connected, one can swap edges between partitions $i \neq j$. Additionally, the construction can be made minimal if $c$ is a multiple of $A_{i, i} + 1$ and $A_{i, j}$ only when $d_i$ is $\textit{not}$.

For the other direction, assume that $\mathcal{O}$ has a finite k-regular cover $C$ with an equitable partition. We wish to show that $\mathcal{M} ( \mathcal{O} )$ is reversible. We start by constructing a Markov model $\mathcal{M} ( \mathcal{C} )$, representing a random walk on the k-regular cover, using the construction outlined in [symmetric]. Hence, $\mathcal{M} ( \mathcal{C} )$ is trivially reversible since every random walk on an undirected graph is equivalent to a reversible Markov chain. If we now apply the "lumping" process described in [symmetric] we get a Markov model which is equivalent to $\mathcal{M}( \mathcal{O} )$ because we are simply summing "edge weights" already normalized by $k$. Thus, if the Markov chain produced by "lumping" $\mathcal{M} (\mathcal{C})$ is reversible then $\mathcal{M} ( \mathcal{O} )$ is also reversible. 

We use the same notation as Boyd. Let $O_v$ be the partition in the cover $C$ containing a representative vertex $v$. By our quotienting process, we know that each partition in $C$ corresponds to a vertex in $\mathcal{O}$. We know that $O_v$ is independent of choice of $v$ because the partition on $C$ is equitable. Choose stationary distribution for $\mathcal{M} ( \mathcal{O} )$ with entries $\pi(O_v) = \sum_{u \in O_v} \pi(u)$ and the transition matrix for $\mathcal{M} ( \mathcal{O} )$  to be $K(O_v, O_{v'}) = \sum_{u \in O_{v'}} P(v, u)$ where $P$ is the transition matrix of the cover $C$. To check that $\mathcal{M} ( \mathcal{O} )$ is reversible:

$$
\begin{align}
	\pi(O_v) K(O_v, O_{v'}) &= \sum_{u \in O_v} \pi(u) K(u, O_{v'}) \cr
							&= \sum_{u \in O_v} \sum_{u' \in O_{v'}} \pi(u) K(u, u') \cr
							&= \sum_{u \in O_v} \sum_{u' \in O_{v'}} \pi(u') K(u', u) \cr
							&= \sum_{u \in O_v} \pi(O_{v'}) K(O_{v'}, u) \cr
							&= \pi(O_{v'}) K(O_{v'}, O_v)
\end{align}
$$

Hence, $\mathcal{M}( \mathcal{O} )$ with vertices corresponding to partitions in $C$ is reversible and $\pi(O_v) = \sum_{u \in O_v} \pi(u)$ is the stationary distribution.

(Note: can make it minimal)