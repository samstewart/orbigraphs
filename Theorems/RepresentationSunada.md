Representation Theory Proof of Sunada for Orbigraphs
====================================================

_Adapted from Quenell (2003)._

**Claim:** Suppose $\Gamma$ is a finite k-regular graph with automorphism subgroup $G$. Also suppose that $G$ has two subgroups $H_1$ and $H_2$ such that $(G, H_1, H_2)$ is a [[Sunada triple | SunadaCondition]]. Let $\Gamma_1 = \Gamma / H_1$ and $\Gamma_2 = \Gamma / H_2 $ using the Orbigraph quotient. Then $ spec \Gamma_1 = spec \Gamma_2 $.

**Proof:** In this proof $H_i$ will refer to either $H_1$ or $H_2$. Also, let $E_\lambda^{\Gamma}$ represent the $\lambda$-eigenspace of $A_\Gamma$. From Godsil and Royle, we have that $ spec \Gamma / H_i \subseteq spec \Gamma $. Then to prove the theorem, we must show that the $dim E_\lambda^{H_i}$ is independent of $i$. (Note that if $\lambda$ is not an eigenvalue of $A_{\Gamma_i}$ then we may say that the $\lambda$-eigenspace has dimension zero.)

Consider the representation $\rho_G$ of $G$ on $\mathbb{C}^{V(\Gamma)}$ given by:

$$
\[\rho_G(g)\phi\](v) = \phi(g^{-1}.v).
$$

Note that this is a valid representation. First let $z,w \in \mathbb{C}$ and $\phi, \psi \in \mathbb{C}^{V(\Gamma)}$. Then we have

$$
\begin{align*}
    \[ \rho_G(g)(z \phi + w \psi) \](v) &= (z \phi + w \psi)(g^{-1}.v) \\\\
    &= z \cdot \phi(g^{-1}.v) + w \cdot \psi(g^{-1}.v) \\\\
    &= z \cdot \[ \rho_G(g)\phi \](v) + z \cdot \[ \rho_G(g)\psi \](v).
\end{align*}
$$

Thus, $\rho_G$ is linear. Next, let $g, h \in G$ and consider:

$$
\begin{align*}
    \[ \rho_G(gh)\phi \](v) &= \phi((gh)^{-1}.v) \\\\
    &= \phi(h^{-1}g^{-1}.v).
\end{align*}
$$

Whereas:

$$
\begin{align*}
    \[ (\rho_G(g) \circ \rho_G(h))\phi \](v) &= (\rho_G(h)\phi)(g^{-1}.v) \\\\
    &= \phi(h^{-1}g^{-1}.v).
\end{align*}
$$

Thus, $\rho_G$ is a homemorphism. Now I will show that a $\lambda$-eigenspace of $A_\Gamma$ is invariant under the action of $\rho_G$. Let $E_{\lambda}^{\Gamma}$ be such an eigenspace and $\phi \in E_{\lambda}^{\Gamma}$. We would like to show that $A_\Gamma (\rho_G(g)\phi) = \lambda (\rho_G(g)\phi)$. We have the following:

$$
\begin{align*}
\[A_\Gamma (\rho_G(g)\phi)\](v) &= \sum_{v \text{~} w} \[ \rho_G(g)\phi \](w) \\\\
&= \sum_{v \text{~} w} \phi(g^{-1}.w) \\\\
&= \sum_{g^{-1}.v \text{~} g^{-1}.w} \phi(g^{-1}.w)
\end{align*}
$$

where the last equality is because $G$ acts by automorphisms. Furthermore, note that any vertex $s$ can be written $g^{-1}.w$ for some vertex $w$, so the sum may be rewritten as $\sum_{g^{-1}.v \text{~} s} \phi(s)$. Of course, this is simply $\[A_\Gamma \phi\](g^{-1}.v) = \lambda \phi(g^{-1}.v)$. On the other hand, we have $\lambda \[\rho_G(g)\phi\](v) = \lambda \phi(g^{-1}.v)$, giving the desired result.

Because $E_{\lambda}^{\Gamma}$ is invariant under $\rho_G$, there is a subrepresentation $\rho_G^\lambda : G \to GL(E_{\lambda}^{\Gamma})$. Note that the degree of $\rho_G^\lambda$ is equal to the dimension $E_{\lambda}^{\Gamma}$. 

Now consider $E_{\lambda}^{\Gamma_i}$, the $\lambda$-eigenspace of $A_{\Gamma_i}$. I will show that its dimension is equal to the dimension of the subspace of $E_{\lambda}^{\Gamma}$ that is fixed by $Res_{H_i}^G \rho_G^\lambda$. Let $\varphi_1 \ldots \varphi_m$ be a basis for $E_{\lambda}^{\Gamma_i}$. I will show that the lifts of these functions 



