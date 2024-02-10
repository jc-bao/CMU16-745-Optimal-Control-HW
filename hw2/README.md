# HW2_S23

**Due Wednesday 2/22 11:59 PM Eastern.**

## Instructions

In this homework, we are going to explore LQR, convex trajectory optimization, and convex model predictive control. Here is an overview of the problems:

1. Solve for the finite-horizon LQR controls as a convex optimization problem, then solve for the optimal feedback policy with the Ricatti recursion. Show that these are equivalent. 

2. Here we will use TVLQR to track a cartpole swingup, as well as infinite horizon LQR to stabilize the cartpole in the inverted position. 

3. In this question we will design controllers using LQR, convex trajectory optimization, and convex MPC for controlling the SpaceX Dragon spacecraft as it rendezvous with the ISS. 

## Submission Instructions 

Feel free to use any method you'd like to export your Jupyter notebook as a PDF (**with all the cell outputs shown**) and **submit on gradescope**. 

### HTML to PDF (Recommended)

We recommend this method of converting your Jupyter notebook to a PDF because it requires no additional installs (hopefully). It's slightly involved, but it is the most consistent in our experience.

1. Open the Jupyter notebook in your favorite **web browser** (not VS Code) with [IJulia](https://github.com/JuliaLang/IJulia.jl).
2. Make sure **all cell outputs are shown** including plots and unit tests' results.
3. In the top left corner of the Jupyter menu bar, do `File -> Save and Export Notebook As -> HTML`. It should download an HTML file.
4. Open the downloaded HTML file in your favorite web browser.
5. Open up the browser's print menu and select `Save as PDF`.
6. Save PDF and **submit on gradescope**.

### Others

If HTML to PDF does not work, feel free to try other methods: [https://mljar.com/blog/jupyter-notebook-pdf/](https://mljar.com/blog/jupyter-notebook-pdf/). 
