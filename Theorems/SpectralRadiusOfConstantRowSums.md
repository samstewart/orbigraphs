**Claim**:
If $A \in \mathcal{C}^{n \times n} \geq 0$ and $A$ is irreducible, the rows of $A$ sum to $k$ then $\rho(A) = k$. 

**Proof**:
By the $\textit{Collatx-Wiedlandt}$ formula (Meyer 673) we know that $\rho(A) = r = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x})$ where

$$
f(\textbf{x}) = \min_{i \in \lbrace 1 \ldots n \rbrace } \frac{\left[ A\textbf{x} \right]_i}{x_i}
$$

and $\mathcal{N} = \lbrace \textbf{x} \geq \textbf{0}, \textbf{x} \neq \textbf{0} \rbrace $. In other words, $\textbf{x}$ must be non-negative and not entirely $\textbf{0}$.

Pick $\textbf{x} = c\cdot \textbf{1}$ for some constant $c$ and let $\textbf{1}$ be a vector of $1$s. Multiplying $A$ by $\textbf{x}$ gives us a set of dot products of the rows of $A$. Let $A_i$ represent the $i$th row of $A$. Then $A \cdot \textbf{x} = \lbrace A_i \cdot \textbf{x} \; | \; i \in \lbrace 1 \ldots n \rbrace \rbrace $. However, since the $\textit{Collatx-Wiedlandt}$ formula normalizes each $A_i \cdot \textbf{x}$ by $x_i$ and all $x_i = c$ then we have the following:

$$
\begin{align}
	\frac{\left[ A \cdot \textbf{x} \right]_i}{x_i} &= \frac{c \left[ A \cdot \textbf{1} \right]_i}{x_i} \cr
	&= \frac{c \left[ A \cdot \textbf{1} \right]_i}{c} \cr
	&= \left[ A \cdot \textbf{1} \right]_i \cr
	&= \sum_{j = 1}^{n} a_{i, j} \cr
	&= k
\end{align}
$$

Substituting back into the $\textit{Collatx-Wiedlandt}$ formula gives us the following:

$$
\min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ A\textbf{x} \right]_i}{x_i} = \min_{i \in \lbrace 1 \ldots n \rbrace} k = k
$$

In other words, picking a constant vector $\textbf{x}$ makes $\rho(A) = \max_{\textbf{x} \in \mathcal{N}} f(\textbf{x}) \geq f(c \cdot \textbf{1}) = k$. To show that $\rho(A) = k$, we must show that $\textbf{x} = c \cdot \textbf{1}$ maximizes $f(\textbf{x})$.

Choose $\textbf{x}$ to be a vector with at least two different entries then choose $x_j$ to be the largest entry in $\textbf{x}$. We know that $x_j \neq 0$ and that $x_j$ is larger than at least one other entry because the entries of $\textbf{x}$ are not identical. We also know that

$$
\begin{align}
	\frac{\left[ A \cdot \textbf{x} \right]_j}{x_j} &= a_{j, 1} x_1/x_j + a_{j, 2} x_2/x_j + \ldots + a_{j, n} x_n/x_j \cr 
	&\geq f(\textbf{x}) \cr
	&= \min_{i \in \lbrace 1 \ldots n \rbrace} \frac{\left[ A \cdot \textbf{x} \right]_i}{x_i}
\end{align}
$$

Furthermore, we know that
$$
a_{j, 1} x_1/x_j + a_{j, 2} x_2/x_j + \ldots a_k + \ldots + a_{j, n} x_n/x_j \leq k
$$

because every $x_m / x_j \leq 1$. Thus, for any $\textbf{x}$ with non-identical entries, $f(\textbf{x}) \leq k$. Hence, $\textbf{x} = c \cdot \textbf{1}$ maximizes $f(\textbf{x})$ showing that $\rho(A) = f(c \cdot \textbf{1}) = k$.

