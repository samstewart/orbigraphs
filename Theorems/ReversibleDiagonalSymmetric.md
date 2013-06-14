Reversible iff product of Diagonal and Symmetric Matrices
=========================================================

**Claim**:
A Markov chain $M$ with transition matrix $P$ is reversible if and only if $P = DS$ where $D$ is a diagonal matrix and $S$ is a symmetric matrix.

**Proof**:
Assume that $M$ is reversible so that $P$ and the stationary distribution $\pi$ satisfy the $\textit{detailed}$ balance equation:

$$
\pi_i P_{i, j} = \pi_j P_{j, i}
$$

Let $S = diag(\pi) P$ where $diag(\pi)$ places the entries of $\pi$ on the diagonal of a matrix with the same dimensions of $P$. By the detailed balance equations, we know that $S$ is symmetric. Now choose $D = diag(\frac{1}{\pi})$ so that $P = DS$ because $(DS)_{i, j} = \frac{1}{\pi_i} P_{i, j} \pi_i = P_{i, j}$. Thus, $P$ can be written as the product of a diagonal and a symmetric matrix.

For the other direction, assume that $P = DS$. By the definition of matrix multiplication, we know that $P_{i, j} = D_{i, i} S_{i, j}$ and $P_{j, i} = D_{j, j} S_{j, i}$. Solving for the entries of $S$ gives us:

$$
\begin{align}
	S_{i, j} &= \frac{P_{i, j}}{D_{i, i}} \cr
	S_{j, i} &= \frac{P_{j, i}}{D_{j, j}} \cr
\end{align}
$$

Because $S$ is symmetric, $S_{i, j} = S_{j, i}$ so
$$
\frac{P_{i, j}}{D_{i, i}} = \frac{P_{j, i}}{D_{j, j}}
$$

Choose $\pi = \frac{1}{diag(D)}$ where $diag(D)$ is a row vector of the diagonal entries of $D$. This choice of $\pi$ satisfies the detailed balance equation:

$$
P_{i, j} \pi_i = P_{j, i} \pi_j
$$

Thus, $\pi$ is the stationary distribution of $M$ and $M$ is reversible.