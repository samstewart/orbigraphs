Spectral Bounds on Singular Points
==================================

**Claim:** Let $\mathcal{O}$ be an $k$-orbigraph on $n$ vertices. If $s$ is the number of singular points in $\mathcal{O}$, then we have
$$
    \frac{\sum_{i} \lambda_i^2 - n k}{k^2 - k} \le s \le \sum_{i} \lambda_i^2 - n k
$$ where $\lambda_i$ are the eigenvalues of the adjacency matrix of $\mathcal{O}$.

**Proof:** First note that $\sum_{i} \lambda_i^2 = tr(A(\mathcal{O})^2)$ and this quantity counts the number of closed walks of length $2$ in $\mathcal{O}$. For a given vertex $v \in \mathcal{O}$, the number of closed walks of length $2$ at $v$ is $\sum_{v \text{~} w} A(\mathcal{O})_{vw} \cdot A(\mathcal{O})_{wv}$ (where $A(\mathcal{O})_{vw}$) denotes the entry in the adjacency matrix of $\mathcal{O}$ giving the number of edges from $v$ to $w$). Vertex $v$ has exactly $k$ out-edges, each of which is matched by at least one in-edge. Thus $tr(A(\mathcal{O})^2) \ge n k$. Additionally, each singular vertex $v$ of $\mathcal{O}$ is adjacent by a multiple edge to at least one other vertex $w$, and that multiple edge contributes at least one extra closed walk to the total number of closed walks of length $2$. Hence $s \le \sum_{i} \lambda_i^2 - n k$. 

For the lower bound, note that each singular vertex $i$ contributes $ \sum_{i \text{~} j} a_{ij} a_{ji} - k $ extra walks of length  two. At most, $a_{ji} = k$ for all $j$. Thus we have

$$
\begin{align*}
	\sum_{i \text{~} j} a_{ij} a_{ji} - k & \le \sum_{i \text{~} j} a_{ij} k - k \cr
										  & = k \sum_{i \text{~} j} a_{ij} - k = k^2 - k.
\end{align*}
$$

Hence, each singular vertex contributes at most $k^2 - k$ extra walks of length two, so $s(k^2 - k) \ge \sum_{i} \lambda_i^2 - n k$.

**Corollary:** An orbigraph $\mathcal{O}$ is a simple $k$-regular graph if and only if $\sum_{i} \lambda_i^2 = n k$ and $\sum_{i} \lambda_i = 0$.

**Proof:** If $\mathcal{O}$ is a simple $k$-regular graph then there are no self loop so $\sum_{i} \lambda_i = tr(A(\mathcal{O})) = 0$. Additionally, note that $\sum_{i} \lambda_i^2 = tr(A(\mathcal{O})^2)$ via Jordan normal form decomposition, and this quantity counts the number closed walks of length $2$ in $\mathcal{O}$. For each vertex of $\mathcal{O}$ there are exactly $k$ closed walks of length $2$, therefore $\sum_{i} \lambda_i^2 = n k$. 

Conversely, assume that $\mathcal{O}$ is an orbigraph such that $\sum_{i} \lambda_i^2 = n k$ and $\sum_{i} \lambda_i = 0$. Then by the previous theorem, we have $s \le 0$. However, $s \ge 0$ by definition so $s = 0$. Thus the neighborhood of each vertex is a $k$-star and because there are no self loops via the second condition, $\mathcal{O}$ must be a simple $k$-regular graph.


**Claim:** If $\mathcal{O}$ is a connected $k$-orbigraph on $n$-vertices with a [[symmetric adjacency matrix | FreeAndSymmetric]] then the number of singular points is bounded above by $ \min \lbrace \frac{1}{2} \sum_{i} \lambda_i^2 - n k , n \rbrace $.

**Proof:** Let $s$ be the number of singular points of $\mathcal{O}$. Clearly, $n \ge s$ so it remains to be shown that $\frac{1}{2} \sum_{i} \lambda_i^2 - n k \ge s$.

As above, we have that each singular point $i$ contributes $ \sum_{i \text{~} j} a_{ij} a_{ji} - k $ extra walks of length two. Here, however, we have $ a_{ij} = a_{ji} $. Additionally, at minimum, $a_{ij} = 2$ for some $j = l$ and $1$ for all others. Thus we have:

$$
\begin{align*}
\sum_{i \text{~} j} a_{ij} a_{ji} - k &= \sum_{i \text{~} j} a_{ij}^2 - k \cr
& \ge 4 + \sum_{i \text{~} j, j \neq l} a_{ij}^2 - k \cr
& = 4 + (k - 2) - k = 2.
\end{align*}
$$

Hence, each singular point contributes at least $2$ extra walks of length two. Thus $2 s \le \sum_{i} \lambda_i^2 - n k$.
