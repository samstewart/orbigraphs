Sunada Subgroups have the Same Order
====================================

**Claim:** If \\( G, H_1, H_2 \\) is a [[Sunada triple | SunadaCondition]], then \\( \\#(H_1) = \\#(H_2) \\).

**Proof:** For each element \\( h \in H_1 \\) let \\( A_h = [h] \cap H_2 \\). Let \\( h \\) be an arbitrary element of \\( H_1 \\). Because \\( h \in [h] \\), we have \\( \\#([h] \cap H_1) \ge 1 \\). Hence by the Sunada condition we have \\( \\#(A_h) = \\#(h \cap H_2) \ge 1 \\). Therefore, we may define a function \\( \phi(h) : H_1 \to H_2 \\) where \\( \phi(h) \in A_h \\). Note that the collection of sets \\( A_h \\) is pairwise disjoint because each conjugacy class \\( [h] \\) is disjoint. Therefore, \\( \phi \\) must be injection, which implies that \\( \\#(H_1) \le \\#(H_2) \\). The same argument shows the inverse statement that \\( \\#(H_1) \ge \\#(H_2) \\). Thus \\( \\#(H_1) = \\#(H_2) \\).
