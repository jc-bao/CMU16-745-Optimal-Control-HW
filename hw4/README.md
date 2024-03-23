# HW4 Spring 2024

**Due Wednesday 4/4 11:59 PM Eastern.**

## Walkthrough Video
[**HW4 Walkthrough Video**](https://youtu.be/RFmqw3YTRnc)

## Instructions

In this homework you will work through the following two problems:
1. Iterative Learning Control (ILC) for a car as it avoids an obstacle. 
2. Making a robot walk with hybrid trajectory optimization with a pre-determined contact sequence.
3. Fill out a project form (one per team)

**NOTE:** UNIT TESTS ARE NOT FULLY COMPREHENSIVE!! PASSING THEM DOES NOT GUARANTEE FULL CREDIT IF CODE IMPLEMENTATION IS INCORRECT.

## Submission Instructions

### Checklist

Before you submit your completed homework PDF, remember to complete **all** the checklist items below:

- Make sure text and code, including special characters, are completely legible.
- Make sure code is completely visible (i.e., no cropped lines). If we can't see it, then we can't grade it... Look at section below for details on remedying this.
- Make sure plots and unit tests have been outputted and rendered properly. **Meshcat** visuals are **exempt**.
- DO NOT ALTER UNIT TEST CASES. We check and can tell...
- Assign questions to **each respective page** of your PDF in Gradescope, including the text of the problem.

### Fixing Cropped Code

If your code is cropped in the PDF, then there are multiple remedies for this:

1. **Split line around binary operator (e.g., +)**:
```
L_grad = FD.gradient(f, x) +
                transpose(FD.jacobian(c, x))*λ
```
2. **Split line around parenthesis**:
```
L_grad = (FD.gradient(f, x)
                + transpose(FD.jacobian(c, x))*λ)
```
3. **Split line after assignment operator (e.g., =)**:
```
L_grad = 
    FD.gradient(f, x) + transpose(FD.jacobian(c, x))*λ
```
4. **Combine 1-3 to split into more lines**:
```
L_grad = 
    FD.gradient(f, x) +
    transpose(FD.jacobian(c, x))*λ
```

5. **Assign terms to more variables**:
```
cost_grad = FD.gradient(f, x)
constraint_jac_T = transpose(FD.jacobian(c, x))

L_grad = cost_grad + constraint_jac_T*λ
```

### Export to PDF

Feel free to use any method you'd like to export your Jupyter notebook as a PDF (**with all checklist items completed**) and **submit on gradescope**. 

We recommend the following method of converting your Jupyter notebook to a PDF because it requires no additional installs (hopefully). It's slightly involved, but it is the most consistent in our experience.

1. Open the Jupyter notebook in your favorite **web browser** (not VS Code) with [IJulia](https://github.com/JuliaLang/IJulia.jl).
2. Go through the **submission checklist**, and make sure **all** relevant items are completed.
3. In the top left corner of the Jupyter menu bar, do `File -> Save and Export Notebook As -> HTML`. It should download an HTML file.
4. Open the downloaded HTML file in your favorite web browser.
5. Open up the browser's print menu and select `Save as PDF`.
6. Save and [combine](https://www.adobe.com/acrobat/online/merge-pdf.html) PDFs. 
7. Submit on **Gradescope**, and make sure to **assign the right pages** to all questions.

### Others

If HTML to PDF does not work, feel free to try other methods: [https://mljar.com/blog/jupyter-notebook-pdf/](https://mljar.com/blog/jupyter-notebook-pdf/). 



## Notes 

- These questions will have long outputs for each cell, remember you can use `cell -> all output -> toggle scrolling` to better see all of the output without having to scroll. 

- IPOPT can take a long time for certain problems. In Jupyter Notebooks, IPOPT will not output anything until IPOPT is finished. If you find that IPOPT is hanging for a long time, it may be that IPOPT is running and taking a very long time (which likely means something else is wrong). To see the output of IPOPT in real time, you have to call the script from the Julia REPL. To do this, you can run the following in the REPL:

```julia 
using NBInclude
@nbinclude("Q1.ipynb")
```

