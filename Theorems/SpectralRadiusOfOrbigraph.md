# Spectral Radius of an Orbigraph

**Claim**: Let \\(O\\) be a k-[[Orbigraph]] and let \\(\rho(O)\\) be the [[spectral radius]] of \\(O\\). Then \\(\rho(O)\\) = k\\).

**Proof**: 
We begin with a definitions followed by a few useful lemmas.

### Connected
[[GraphConnectedness]]

### Strongly Connected
[[GraphConnectedness]]

### Weakly Connected
[[GraphConnectedness]]

### Lemma 1.0

**Claim**:
Let \\(O\\) be a k-oribigraph. If \\(O\\) is weakly connected then it is strongly connected.

**Proof**:
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is weakly connected. We wish to show that \\(O\\) is also strongly connected. We know that for every non-zero entry \\(a_{i,j} \in A\\) the corresponding entry \\(a_{j,i} \in A\\) is also non-zero, by definition. This symmetry means that if there is an edge from vertex \\(i\\) to vertex \\(j\\) then there is an edge from vertex \\(j\\) to vertex \\(i\\). Also by definition, if \\(O\\) is weakly connected, than for any two verticies \\(i, j\\) there exists an edge, WLOG \\((i, j)\\) between them. By the symmetry of \\(A\\) we also know there is an edge \\((j, i)\\) in the opposite direction. Hence, \\(O\\) is strongly connected.

### Lemma 1.1:
**Claim**:
Let \\(O\\) be a k-orbigraph. If \\(O\\) is disconnected, then the disconnected subgraphs of \\(O\\) are also k-orbigraphs.

**Proof**:
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is disconnected. Call each disconnected subgraph \\(o_i\\). Arrange the rows of \\(A\\) so that 

### Lemma 1.2:
**Claim**:
If \\(A \in \mathcal{C}^{n \times n} \geq 0\\) and the rows of \\(A\\) sum to \\(k\\) then \\(\rho(A) = k\\). 

**Proof**:
By the \\(\textit{Collatx-Wiedlandt}\\) formula (Meyer 673) we know that \\(\rho(A) = r = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x})\\) where

$$
f(\textbf{x}) = \min_{i \in \{1 \ldots n\}} \frac{\left[ A\textbf{x} \right]_i}{x_i}
$$

and \\(\mathcal{N} = \{\textbf{x} \geq \textbf{0}, \textbf{x} \neq \textbf{0}\}\\). In other words, \\(\textbf{x}\\) must be non-negative and not entirely \\(\textbf{0}\\).

Pick \\(\textbf{x} = [c \ldots c]\\) where \\(c\\) is some constant and let \\(\textbf{1}\\) be a vector of \\(1\\)s. Multiplying \\(A\\) by such a vector gives us a set of dot products. Let \\(A_i\\) represent the \\(i\\)th row of \\(A\\). Then \\(A \textbf{x}) = \{A_i \cdot \textbf{x} | i \in \{1 \ldots n\}\}\\). However, since the \textit{Collatx-Wiedlandt} formula normalizes each \\(A_i \cdot \textbf{x}\\) by \\(x_i\\) and all \\(x_i) = c\\) then we have the following:

$$
\begin{align}
	\frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i} &= \frac{c \left[ \textbf{A}\textbf{1} \right]_i}{x_i} \\
	&= \frac{c \left[ \textbf{A}\textbf{1} \right]_i}{c} \\ 
	&= \left[ \textbf{A}\textbf{1} \right]_i \\
	&= \sum_{j = 1}^{n} a_{i, j} \\
	&= k
\end{align}
$$

Substituting back into the \\(\textit{Collatx-Wiedlandt}\\) gives us the following:

$$
\begin{align}
	\min_{i \in \{1 \ldots n\}} k &= k \\
	\implies \rho(A) &= k
\end{align}
$$

In other words, picking a constant vector \\(\textbf{x}\\) makes \\(\rho(A) = k\\). To show that this choice of \\(\textbf{x}\\) indeed maximizes \\(f(\textbf{x})\\), we wish to show the following for all choices of \\(\textbf{x}\\) such that \\(\textbf{x}\\) contains at least two entries that are different:

$$
\begin{align}
	\min_{i \in \{1 \ldots n\}} \frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i} \leq k
\end{align}
$$

Expanding the dot product gives us the following:

$$
\min_{i \in \{1 \ldots n\}} \frac{a_{i, 1} x_1 + a_{i, 2} x_2 + \ldots + a_{i, n} x_n}{x_i}
$$

To minimize this expression, choose \\(i\\) such that \\(x_i\\) is the largest entry in \\(\textbf{x}\\). Let \\(k = i\\) so that we get the following after dividing the above expression by \\(x_i\\):
$$
a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k + \ldots + a_{i, n} x_n/x_i
$$

We know that our choice of \\(x_i\\) minimizes the expression because each coefficient \\(x_j/x_i \leq 1\\), excluding the coefficient of \\(a_k\\) which is \\(1\\). Picking any other entry results in an expression with coefficients \\(x_j/x_i \geq 1\\) if \\(x_i\\) is not the largest element. Thus, \\(x_i\\) minimizes the original expression. Furthermore, we know know that \\(x_i \neq 0\\) and that \\(x_i\\) is strictly greater than at least one other entry in \\(\textbf{x}\\) because otherwise \\(\textbf{x}\\) would have all identical entries. Thus, there is at least one coefficient \\(x_j/x_i \leq 1\\) in \\(a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k + \ldots + a_{i, n} x_n/x_i\\) so that:

$$
\begin{align}
	a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k + \ldots + a_{i, n} x_n/x_i &\leq a_{i, 1} c/c + a_{i, 2} c/c + \ldots a_k + \ldots + a_{i, n} c/c \\
	&= \sum_{j = 1} a_{i,j} \\
	&= k
\end{align}
$$
Hence, if \\(\textbf{x}\\) does not have only identical entries, then it does not maximize \\(\min_{i \in \{1 \ldots n\}} \frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i}\\). Only when \\(\texbtf{x}\\) has identical entries, giving \\(\rho(A) = k\\), does it maximize the expression. Thus, by the \textit{Collatx-Wiedlandt} formula we know that \\(\rho(A) = k\\).
