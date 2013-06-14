Characterization of Good/Bad Orbigraphs
=======================================

Definitions needed:
Markov chain
Stationary distribution
Limiting distribution
Irreducible markov chain
Reversibility

**Claim**:
If $O$ is k-orbigraph, then $O$ has a finite k-regular cover if an only if, when converted to a Markov chain, $O$ is reversible.

**Proof**:
We start with the first direction: if $O$, when converted to a Markov chain, is reversible, then $O$ has a finite k-regular cover. Let $\mathcal{M}(O)$ denote the Markov chain, associated with orbigraph $O$, which can be constructed by simply normalizing the rows of the adjacency matrix of $O$ by $k$. Let $P$ be the stochastic transition matrix of $\mathcal{M}(O)$ and $P_{i,j}$ denote the probability of moving from 

If $\mathcal{M}(O)$ is reversible, then by definition, there exists a stationary distribution $\pi$, such that for any two states $i$ and $j$, $\pi$ satisfies the $\textit{detailed balance equation}$:

$$
\pi_i P_{i, j} = \pi_j P_{j, i}
$$

We will use this equality to produce a finite k-regular cover for $O$. We start by "denormalizing" $P_{i,j}$ and $P_{j, i}$ by multiplying both sides of the quality by $k$ giving us the following:

$$
\pi_i A_{i, j} = \pi_j A_{j,i}
$$

where $A$ is the integer-valued adjacency matrix of $O$. Next, we "denormalize" $\pi_i$ and $\pi_j$. We know that every reversible Markov chain can be represented as a walk on some undirected graph (citation needed, do we want to prove it this way?) so that the stationary distribution becomes $\pi_i = \frac{W(i)}{W}$ where $W(i)$ is the total outgoing edge weights from vertex $i$ in the undirected graph and $W$ is the total outgoing edge weights. Thus, we can multiply both sides of the detailed balance equation by some $W$ to "denomalize" $\pi_i$ and $\pi_j$ to new integer values $d_i$ and $d_j$.

$$
d_i A_{i, j} = d_j A_{j, i}
$$

We wish to construct a k-regular covering using this equation. Multiply both sides of the equation by a new constant integer $c$.

$$
c d_i A_{i, j} = c d_j A_{j, i}
$$

To construct our cover, we place $c d_i$ vertices in partition $i$ and $c d_j$ vertices in partition $j$. Each vertex in partition $i$ connects to $A_{i, j}$ vertices in partition $j$ and each vertex in partition $j$ connects to $A_{i, j}$ vertices in partition $i$. Thus, we must choose $c$ such that $A_{j, i} | c d_i$ and $A_{i, j} | c d_j$. However, regardless of what $c$ we choose, the total balance equation implies:

$$
(c d_i) A_{i, j} = (c d_j) A_{j, i}
$$

In other words, the total number of edges exiting partition $i$ is the same as the total number of edges exiting partition $j$. Moreover, because of the way we chose $c$, these edges can be equally distributed among the $c d_i$ vertices in partition $i$ and $c d_j$ vertices in partition $j$.

Now we handle the connections $\textit{within}$ each partition. Each partition $i$ needs a multiple of $A_{i, i} + 1$ vertices since each vertex must connect to $A_{i, i}$ other vertices. Thus, we choose $c$ such that $(A_{i, i} + 1) | c d_i$. To satisfy the constraints for all partitions, we chose $c = LCM(\lbrace A_{i,j} | A_{i, j} \neq 0 \rbrace)$.

This construction produces a k-regular cover with an equitable partition. To ensure it is connected, simply swap any two outgoing edges from a partition with more than a single element.