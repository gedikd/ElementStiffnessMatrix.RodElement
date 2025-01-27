# ElementStiffnessMatrix.RodElement
Element Stiffness Matrix Derivation of Rod Element (Matlab) 

The objective of this project is to derive the element stiffness matrix of a bar/rod element using MATLAB. Unlike conventional approaches, where the modulus of elasticity and the cross-sectional area are assumed constant, this study considers these parameters as functions varying along the longitudinal axis of the element. Consequently, the governing equation becomes more complex, resulting in terms that are difficult to integrate analytically. To address this, Gaussian-Legendre numerical integration has been implemented in MATLAB, enabling an approximate solution for the integral.

The reports and code are available in this repository.

##Usage
The report is located in the `rodFEM.gedikd.pdf ` file.

Related functions are `rod_element_stiffness_2node.m` and `rod_element_stiffness_3node.m`

You can use `input` files to use these functions for your own problems. 
