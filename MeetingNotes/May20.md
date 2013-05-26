Meeting Notes for May 20
========================

We discussed the goals of the project. In particular, there are 3 existing versions of Sunada's theorem for graphs. In general, they are all of the form: Let $\Gamma$ be a graph satisfying (some conditions) with a group $G$ that acts by symmetries on $\Gamma$. Then if $H_1$ and $H_2$ are subgroups of $G$ that satisfy the Sunada condition (and possibly others), then $spec \Gamma / H_1 = spec \Gamma / H_2 $ (by some quotient). One common condition for $\Gamma$ is that it must be k-regular. A common condition for the groups is that they must act without fixed points. The following table summarizes the version of the theorem which we have seen.

<table>
    <tr>
        <td>Author</td>
        <td>Fixed Point Condition</td>
        <td>k-Regular Condition</td>
        <td>Quotient Process</td>
    </tr>
    <tr>
        <td>Brooks</td>
        <td>Strong</td>
        <td>Yes</td>
        <td>Standard</td>
    </tr>
    <tr>
        <td>Quenell</td>
        <td>Strong</td>
        <td>Yes</td>
        <td>Standard</td>
    </tr>
    <tr>
        <td>Halbeisen</td>
        <td>Weak</td>
        <td>No</td>
        <td>Non-standard / Unclear</td>
    </tr>
</table>

From this, and the [[example | /Mathematica/SunadaOrbigraphs.nb]] that we have found, we have the following conjecture:

**Conjecture:** Suppose $\Gamma_1$ and $\Gamma_2$ are good k-[[orbigraphs | Orbigraph]] that have the same number of vertices. We can write $\Gamma_1 = \Gamma / H_1$ and $\Gamma_2 = \Gamma / H_2$ for some groups $H_1$ and $H_2$ where the quotient is the orbigraph quotient and $H_1, H_2 \le G$ for some group $G$ which acts on $\Gamma$ by automorphisms. Then $spec \Gamma_1 = spec \Gamma_2$.

Note that the existance of a common covering graph $\Gamma$ for $\Gamma_1$ and $\Gamma_2$ is given by Leighton's theorem and the fact that these are good orbigraphs.

We also would like to consider a generalization to this conjecture by dropping the goodness condition. This requires us to consider the k-trees from with the orbigraphs originate, and we are unsure of what conditions are necessary, or what the analog to the Sunada condition here would be. It probably has something to do with [[representation theory | http://en.wikipedia.org/wiki/Representation_theory]].

Finally, we had a short discussion of the conjectured spectral radius result for orbigraphs.
