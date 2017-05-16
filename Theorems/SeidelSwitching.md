Seidel Switching
================

Seidel Switching is a method to construct cospectral pairs of graphs given any pair of base graphs. It has previously been used in undirected graphs, but there is very little literature on its use in directed graphs.

**Procedure:** Suppose $\mathcal{O_1}$ and $\mathcal{O_2}$ are $k$-orbigraphs each on $2l$ vertices with adjacency matrices $A$ and $B$ respectively. Furthermore, suppose that $T$ is a _switching matrix_, that is, it is a $(0,1)$-matrix with each row and each column summing to $l$. Let $J$ be a $2l \times 2l$ matrix of ones. Then define two new orbigraphs $\mathcal{S_1}$ and $\mathcal{S_2}$ as follows:

$$
A(\mathcal{S_1}) = \begin{bmatrix}
    A & T \\\\
    T^T & B
\end{bmatrix}
$$

$$
A(\mathcal{S_2}) = \begin{bmatrix}
    A & J - T \\\\
    (J - T)^T & B
\end{bmatrix}.
$$

**Claim 1:** The orbigraphs $\mathcal{S_1}$ and $\mathcal{S_2}$ are cospectral.

(Note, in the following, the term "constant row sum matrix" is used to describe a matrix $A$ such that $A 1 = k 1$ for some $k$. It is easy to show that the sum or product of constant row sum matrices is a constant row sum matrix and that the function $Rs(A) = k$ is additive and multiplicative. Similarly, "constant column matrices" are those in which for each column, every entry is the same. This set is likewise closed under addition and multiplication.)

**Lemma 1:** If $T$ is any switching matrix and $A$ and $B$ are as above, then $\begin{bmatrix}
    A & T \\\\
    T^T & B
\end{bmatrix}^n = \begin{bmatrix}
    X & Y \\\\
    Z & W
\end{bmatrix}$ where $X, Y, Z$, and $W$ are constant row sum matrices and the row sums of each are independent of $T$.

**Proof of Lemma 1:** We will proceed by induction on $n$. The base case is trivial. Assume that for some $n = m$ the lemma holds. Then we have
$$
\begin{bmatrix}
    A & T \\\\
    T^T & B
\end{bmatrix}^{m+1} = \begin{bmatrix}
    X & Y \\\\
    Z & W
\end{bmatrix} \cdot \begin{bmatrix}
    A & T \\\\
    T^T & B
\end{bmatrix} = \begin{bmatrix}
    XA + YT^T & ZA + WT^T \\\\
    XT + YB & ZT + WB
\end{bmatrix}.
$$
Because each block is a sum of products of constant row sum matrices, they are constant row sum matrices themselves. Furthermore, to see that the row sum is independent of $T$, calculate i.e. $Rs(XA + YT^T) = Rs(X)Rs(A) + Rs(Y)Rs(T^T) = Rs(X)Rs(A) + Rs(Y) \cdot l$. Which is independent of $T$ by the induction hypothesis.


**Lemma 2:** For any $n$, we have $A(\mathcal{S_1})^n = \begin{bmatrix}
    C & X \\\\
    Y & D
\end{bmatrix}$ and $A(\mathcal{S_2})^n = \begin{bmatrix}
    C - S_1 & S_2 - X \\\\
    S_3 - Y & D - S_4
\end{bmatrix}$, where $S_1,\ldots,S_4$ are constant column matrices, and $S_1$ and $S_4$ have row sums $0$.

**Proof of Lemma 2:** We will proceed by induction on $n$. For the base case, we let $C = A, X = T, Y = T^T, D = B, S_1 = 0, S_2 = J, S_3 = J, S_4 = 0$. The only thing interesting to note here is that $S_3 = J$ is valid because $S_3 - Y = J - T^T = (J - T)^T$, using the fact that $J$ is symmetric.

Now, suppose that for some $n = m$ the theorem holds. Then we have
$$
A(\mathcal{S_1})^{m+1} = \begin{bmatrix}
    C & X \\\\
    Y & D
\end{bmatrix} \cdot \begin{bmatrix}
    A & T \\\\
    T^T & B
\end{bmatrix} = \begin{bmatrix}
    CA + XT^T & CT + XB \\\\
    YA + DT^T & YT + DB
\end{bmatrix}.
$$

Furthermore, we have

$$
A(\mathcal{S_1})^{m+1} = \begin{bmatrix}
    C - S_1 & S_2 - X \\\\
    S_3 - Y & D - S_4
\end{bmatrix} \cdot \begin{bmatrix}
    A & J - T \\\\
    (J - T)^T & B
\end{bmatrix} = \begin{bmatrix}
    (CA + XT^T) - S_1 A + S_2 J - S_2 T^T - X J & CJ - S_1 J + S_1 T + S_2 B - (CT + XB) \\\\
    S_3 A + DJ - S_4 J + S_4 T^T - (YA + DT^T) & (YT + DB) + S_3 J - S_3 T - YJ - S_4 B
\end{bmatrix}
$$

Thus we now have
$$
\begin{align*}
S'_1 &= - S_1 A + S_2 J - S_2 T^T - X J \\\\
S'_2 &= CJ - S_1 J + S_1 T + S_2 B \\\\
S'_3 &= S_3 A + DJ - S_4 J + S_4 T^T \\\\
S'_4 &= S_3 J - S_3 T - YJ - S_4 B
\end{align*}
$$
We need only verify that these are each constant column matrices and that $Rs(S'_1) = Rs(S'_4) = 0$. To see that they are constant column matrices, note that each $S'_i$ is the sum of multiples of $S_j$ and left multiples of $J$ by constant row sum matrices. By the induction hypothesis, $S_j$ is a constant colum matrix, so any multiple thereof is as well. Furthermore, any left multiple of $J$ by a constant row sum matrix is a multiple of $J$ and is therefore a constant column matrix. Thus the $S'_j$ are constant column matrices. 

By the previous lemma, we have that $Rs(CA + XT^T - S'_1) = Rs(CA + XT^T)$, but this implies that $Rs(S'_1) = 0$. The same reasoning shows that $Rs(S'_4) = 0$.

**Proof of Claim 1:** This follows immediatly from Lemma 2 and [[CyclesCospectrality]]. We have
$$
Tr(A(\mathcal{S_2})^n) = Tr(\begin{bmatrix}
    C - S_1 & S_2 - X \\\\
    S_3 - Y & D - S_4
\end{bmatrix}) = Tr(C) - Tr(S_1) + Tr(D) - Tr(S_4).
$$
However, $S_1$ and $S_4$ are constant column matrices with row sums $0$, so their traces are $0$. Hence $Tr(A(\mathcal{S_2})^n) = Tr(A(\mathcal{S_1})^n)$.
