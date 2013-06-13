Characterization of Good/Bad Orbigraphs
=========================================================

Definitions needed:
Markov chain
Stationary distribution
Limiting distribution
Irreducible markov chain
Reversibility

**Claim**:
If $O$ is k-orbigraph, then $O$ has a finite k-regular cover if an only if, when converted to a Markov chain, $O$ is reversible.

**Proof**:
We start with the first direction: if $O$, when converted to a Markov chain, is reversible, then $O$ has a finite k-regular cover. Let $\mathcal{M}(O)$ denote the Markov chain associated with orbigraph $O$ which can be constructed by simply normalizing the rows of the adjacency matrix of $O$ by $k$. Let $P$ be the stochastic transition matrix of $\mathcal{M}(O)$ and $P_{i,j}$ denote the probability of moving from 

If $\mathcal{M}(O)$ is reversible, then by definition, there exists a stationary distribution $\pi$, such that for any two states $i$ and $j$, $\pi$ satisfies the $\textit{detailed balance equation}$:

$$
\pi_i P_{i, j} = \pi_j P_{j, i}
$$

We will use this equality to produce a finite k-regular cover for $O$. We start by "denormalizing" $P_{i,j}$ and $P_{j, i}$ by multiplying both sides of the quality by $k$ giving us the following:

$$
\pi_i A_{i, j} = \pi_j A_{j,i}
$$

where $A$ is the integer-valued adjacency matrix of $O$. Next, we "denormalize" $\pi_i$ and $\pi_j$. We know that every reversible Markov chain can be represented as a walk on some undirected graph (citation needed, do we want to prove it this way?) so that the stationary distribution becomes $\pi_i = \frac{W(i)}{W}$ where $W(i)$ is the total outgoing edge weights from vertex $i$ in the undirected and $W$ is the total number of edge weights. Thus, we can multiply both sides of the detailed balance equation by some $W$ to "denomalize" $\pi_i$ and $\pi_j$. Let $d_i$ and $d_j$ be these new integer values.

$$
\d_i A_{i, j} = \d_j A_{j, i}
$$

We wish to construct a k-regular covering using this equation. To be a valid covering, partition $i$ in the covering must have enough vertices so that each vertex in partition $j$ can connect to exactly $A_{j, i}$ vertices in $i$. Conversely, partition $j$ should have enough vertices so that each vertex in partition $i$ can connect to exactly $A_{i, j} vertices in $j$. Using the detailed balance equation, we can pick the number of vertices in parition $i$, call it $N_i$, to be $d_i$ and the number of vertices in partition $j$, call it $N_j$, to be $d_j$. We know that $d_i = A_{j,i}$ and $d_j = A_{i, j}$ because this choice satisfies the equality:

$$
\begin{align}
	\d_i A_{i, j} 	  &= \d_j A_{j, i} \cr
	A_{j, i} A_{i, j} &= A_{i, j} A_{j, i} \cr
	A_{i, j} A_{j, i} &= A_{i, j} A_{j, i}
\end{align}
$$

Moreover, we can pick any multiple $c$ of so that $N_i = c d_i$ and $N_j = c d_j$ because $c d_i = c A_{j, i}$. In other words, each vertex in partition $i$ connects to $c A_{j, i}$ vertices in $j$, or equivalently, there are $c A_{j, i}$ vertices in partition $i$ that each connect to $A_{j, i}$ vertices in partition $j$ (likewise for partition $j$ to partition $i$). 