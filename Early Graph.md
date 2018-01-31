### Logic Tree

A logic tree, demonstrating some of th epossible outcomes of how purple sea urchin larva may react developmentally to a lowering pH due to ocean acidication. 

```mermaid

graph TD
A(How will Sea Urchin larva react to ocean acidification?)
A-->B(Is the pH decreasing?)
B--> |Yes| C(Is the pH lowering variably or statically?)
B--> |No| D(Are Larval lengths longer than treatment length? )
C--> |Variable|E(Are larval body lengths longer than at static pH?)
C--> |Static|F(Are larval body lengths longer than at variable pH?)
D--> |Yes| G[Ocean acidification may stunt development of Purple Urchins]
D --> |No| H[Ocean acidificaion will not affect Purple urchin development]
E --> |Yes| I[A static decrease in pH will stunt development more so than a variable decrease in pH]
E--> |No| J[A variable decrease in pH will stunt development more so than a static decrease in pH]
F--> |Yes| J
F--> |No|I
J--> K
I-->K(Are body lengths longer or shorter than in nature?)
K--> |Yes|G
K--> |No| H
```

## Early Graph  

######Graphs depicting possible outcomes of Purple Sea urchin larvae lengths depending on pH and whether the pH was constant (static) or changing (variable)



![alt](IMG-0382.JPG)

![alt](IMG-0383.JPG)

![alt](IMG-0384.JPG)