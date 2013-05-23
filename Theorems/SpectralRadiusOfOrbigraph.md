# Spectral Radius of an Orbigraph

**Claim**: Let \\(O\\) be a k-[[Orbigraph]] and let \\(\rho(O)\\) be the [[spectral radius]] of \\(O\\). Then \\(\rho(O) = k\\).

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
Let \\(A\\) be the adjacency matrix of \\(O\\) and assume that \\(O\\) is disconnected. Call each disconnected subgraph \\(o_i\\). Bundle the vertices of \\(O\\) into disjoint sets where membership is determined by the vertex's membership in \\(o_i\\). Re-arrange \\(A\\)

### Lemma 1.2:
**Claim**:
If \\(A \in \mathcal{C}^{n \times n} \geq 0\\) and the rows of \\(A\\) sum to \\(k\\) then \\(\rho(A) = k\\). 

**Proof**:
By the \\(\textit{Collatx-Wiedlandt}\\) formula (Meyer 673) we know that \\(\rho(A) = r = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x})\\) where

$$
f(\textbf{x}) = \min_{i \in \lbrace 1 \ldots n \rbrace } \frac{\left[ A\textbf{x} \right]_i}{x_i}
$$

and \\(\mathcal{N} = \lbrace \textbf{x} \geq \textbf{0}, \textbf{x} \neq \textbf{0} \rbrace \\). In other words, \\(\textbf{x}\\) must be non-negative and not entirely \\(\textbf{0}\\).

Pick \\(\textbf{x} = c\cdot \textbf{1}\\) for some constant \\(c\\) and let \\(\textbf{1}\\) be a vector of \\(1\\)s. Multiplying \\(A\\) by \\(\textbf{x}\\) gives us a set of dot products of the rows of \\(A\\). Let \\(A_i\\) represent the \\(i\\)th row of \\(A\\). Then \\(A \cdot \textbf{x} = \lbrace A_i \cdot \textbf{x} \; | \; i \in \lbrace 1 \ldots n \rbrace \rbrace \\). However, since the \\(\textit{Collatx-Wiedlandt}\\) formula normalizes each \\(A_i \cdot \textbf{x}\\) by \\(x_i\\) and all \\(x_i = c\\) then we have the following:

$$
\begin{align}
	\frac{\left[ A \cdot \textbf{x} \right]_i}{x_i} &= \frac{c \left[ A \cdot \textbf{1} \right]_i}{x_i} \\\\
	&= \frac{c \left[ A \cdot \textbf{1} \right]_i}{c} \\\\
	&= \left[ A \cdot \textbf{1} \right]_i \\\\
	&= \sum_{j = 1}^{n} a_{i, j} \\\\
	&= k
\end{align}
$$

Substituting back into the \\(\textit{Collatx-Wiedlandt}\\) formula gives us the following:

$$
\begin{align}
	\min_{i \in \lbrace 1 \ldots n \rbrace} k \\\\
	&= k
\end{align}
$$

In other words, picking a constant vector \\(\textbf{x}\\) makes \\(\rho(A) = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x}) \geq f(c \cdot \textbf{1})\\). To show that \\(\textbf{x} = c \cdot \textbf{1}\\) indeed maximizes \\(f(\textbf{x})\\) for \\(\textit{any}\\) \\(\textbf{x} \in \mathcal{N}\\), we must show the following for all \\(\textbf{x}\\) such that \\(\textbf{x}\\) contains at least two different entries:

$$
\begin{align}
	\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i} \leq k
\end{align}
$$

Expanding the dot product gives us the following:

$$
\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{a_{i, 1} x_1 + a_{i, 2} x_2 + \ldots + a_{i, n} x_n}{x_i}
$$

To minimize this expression, choose \\(i\\) such that \\(x_i\\) is the largest entry in \\(\textbf{x}\\). Let \\(k = i\\) so that we get the following after dividing the above expression by \\(x_i\\):
$$
a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k \ldots + \ldots + a_{i, n} x_n/x_i
$$

We know that our choice of \\(x_i\\) minimizes the expression because each coefficient \\(x_j/x_i \leq 1\\), excluding the coefficient of \\(a_k\\) which is \\(1\\). Picking any other entry besides the largest results in an expression with coefficients \\(x_j/x_i \geq 1\\) if \\(x_i\\) is not the largest element. Thus, \\(x_i\\) minimizes the original expression. Furthermore, we know know that \\(x_i \neq 0\\) and that \\(x_i\\) is strictly greater than at least one other entry in \\(\textbf{x}\\) because otherwise \\(\textbf{x}\\) would have all identical entries. Thus, there is at least one coefficient \\(x_j/x_i \leq 1\\) in \\(a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k + \ldots + a_{i, n} x_n/x_i\\) so that:

$$
\begin{align}
	&a_{i, 1} x_1/x_i + a_{i, 2} x_2/x_i + \ldots a_k + \ldots + a_{i, n} x_n/x_i \\\\
	&\leq a_{i, 1} c/c + a_{i, 2} c/c + \ldots a_k + \ldots + a_{i, n} c/c \\\\
	&= \sum_{j = 1} a_{i,j} \\\\
	&= k
\end{align}
$$
Since \\(\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i} = k\\) when \\(\textbf{x}\\) has identical entries and \\(\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ \textbf{A}\textbf{x} \right]_i}{x_i} \leq k\\) when \\(\textbf{x}\\) does not have identical entries, then \\(\textbf{x} = [c \ldots c]\\) maximizes the expression. Thus, assuming \\(textbf{x}\\) contains identical entries, by the \\(\textit{Collatx-Wiedlandt}\\) formula we know that \\(\rho(A) = k\\).

### Lemma 1.3
