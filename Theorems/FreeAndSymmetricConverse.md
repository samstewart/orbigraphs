Symmetric Orbigraph Adjacency Matrix Implies Free Quotient
==========================================================

**This may not be true. Disregard the below. Here is a possible counterexample:**

$$
A(\mathcal{O}) = \left(
\begin{array}{ccc}
 0 & 2 & 1 \\\\
 2 & 1 & 0 \\\\
 1 & 0 & 2 \\\\
\end{array}
\right)
$$

**Claim:** If $ \mathcal{O} $ is an [[orbigraph | Orbigraph]] such that $ A(\mathcal{O}) $ is symmetric, then there exists a k-regular graph $ \Gamma $ with a automorphism subgroup $ H $ such that $ H $ acts freely on $ \Gamma $ and $ \Gamma / H = \mathcal{O} $.

**Proof:** Suppose that $ \mathcal{O} $ has $ n $ vertices and therefore $ A = (a_ij) $ is $ n \times n $. Let $ m = 2*LCM(a_{ij}) $ where the LCM is taken over the positive elements of $ A $. Construct a graph $ \Gamma $ with $ m \cdot n $ vertices. Partition these vertices into $ n $ sets, labeled $ \pi_1,\ldots,\pi_n $ each containing $ m $ vertices. Number the vertices in $ \pi_i $ by $ v_{ik} $ for $ k \in {0,\ldots,m-1} $. Add an edge between a pair vertices $ v_{ik} $ and $ v_{jl} $ if and only if $ k \equiv l - 1 \pmod{ \frac{m}{a_{ij}} }  $. Note that $ a_{ij} \vert m $ by the construction of $ m $. This means of construction ensures that each vertex in $ \pi_i $ is connected to $ a_{ij} $ vertices in $ \pi_j $ and vice-versa. We subtract $ 1 $ in the condition in order to ensure that $ v_{ik} $ is not connected itself. The graph $ \Gamma $ is now k-regular because each vertex $ v_{ik} $ is connected to $ \sum_{j=1}^n a_{ij} = k $ others, by the conditions on an orbigraph adjacency matrix. Additionally, it is clear that the partition $ \pi = \lbrace \pi_1,\ldots,\pi_n \rbrace $ is equitable with the same number of vertices in each partition element. Then we have that the group $ C_m $ acts freely on $ \Gamma $ by cycling the vertices within each partition element.
