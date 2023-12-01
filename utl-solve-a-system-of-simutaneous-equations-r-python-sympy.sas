%let pgm=utl-solve-a-system-of-simutaneous-equations-r-python-sympy;

 Solve a system of simutaneous equations r python sympy

 github
 https://tinyurl.com/4z3ps3d3
 https://github.com/rogerjdeangelis/utl-solve-a-system-of-simutaneous-equations-r-python-sympy

 stackoverflow
 https://tinyurl.com/4rhzychy
 https://stackoverflow.com/questions/77564196/solving-two-equations-with-two-variables-one-of-the-equations-is-nonlinear

 Sometimes it is worth checking to see if there is a closed form solution.

 If you can approximate your equations with ones that yeild closed form solutions then
 you may be able to uses the closed form solutions for initial guesses for your
 original equations.

  Three Solutions

     1. Python symbolic algebra (does not require an initial estimate)
        I suspect you can manually solve this problem using algebraic manipulations.
        Most system of simultaneous equations do not have a closed form solution.

        1+x**2*y**2-x**2-y**2
        (x-1)*(x-2)*y**2 - 3*(x**2-1)*y + (x+1)*(2*x+1) - 4
        Provides all four solutions

     2. Abother symbolic algebra solution (does not require an initial estimate)

        eq1=log(x) + log(y) - log(5);
        eq2=(log(x) + 2 * log(y))/2 - log(10);

     3. R numerical analysis (using 1st solution)

        1+x**2*y**2-x**2-y**2
        (x-1)*(x-2)*y**2 - 3*(x**2-1)*y + (x+1)*(2*x+1) - 4

        Requires and initial guess
        x=-1,y=-1 and yeilds jut one solution

     4, Related repos



/*
 _ __  _ __ ___   ___ ___  ___ ___  ___  ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|/ _ \/ __|
| |_) | | | (_) | (_|  __/\__ \__ \  __/\__ \
| .__/|_|  \___/ \___\___||___/___/\___||___/
|_|
 _
/ |  ___ _   _ _ __ ___  _ __  _   _
| | / __| | | | `_ ` _ \| `_ \| | | |
| | \__ \ |_| | | | | | | |_) | |_| |
|_| |___/\__, |_| |_| |_| .__/ \__, |
         |___/          |_|    |___/
*/
%symdel frompy / nowarn;

%utl_submit_wps64x('
proc python;
submit;
import pyperclip;
from sympy import solve;
from sympy.abc import x, y;
res=solve([1+x**2*y**2-x**2-y**2
         ,(x-1)*(x-2)*y**2 - 3*(x**2-1)*y + (x+1)*(2*x+1) - 4], x, y, dict=True);
print(res);
pyperclip.copy(str(res));
endsubmit;
run;quit;
',return=fromPy);

%put %=frompy;

/*
FROMPY=[{x: -1, y: -sqrt(6)/3}, {x: -1, y: sqrt(6)/3}, {x: -sqrt(6)/3, y: -1}, {x: sqrt(6)/3, y: -1}]
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* EQUATIONS                                                                                                              */
/*                                                                                                                        */
/* 1+x**2*y**2-x**2-y**2                                                                                                  */
/* (x-1)*(x-2)*y**2 - 3*(x**2-1)*y + (x+1)*(2*x+1) - 4                                                                    */
/*                                                                                                                        */
/*                                                                                                                        */
/*  %put &=frompy;  returns a wps macro variable from python                                                              */
/*                                                                                                                        */
/*  Closed form solutions                                                                                                 */
/*                                                                                                                        */
/*  Creates the macro variable frompy in the parent address space                                                         */
/*                                                                                                                        */
/*  FROMPY=[{x: -1, y: -sqrt(6)/3}, {x: -1, y: sqrt(6)/3}, {x: -sqrt(6)/3, y: -1}, {x: sqrt(6)/3, y: -1}]                 */
/*                                                                                                                        */
/*  All four solutions                                                                                                    */
/*                                                                                                                        */
/*  Obs        X           Y                                                                                              */
/*                                                                                                                        */
/*   1     -1.00000    -0.81650                                                                                           */
/*   2     -1.00000     0.81650                                                                                           */
/*   3     -0.81650    -1.00000                                                                                           */
/*   4      0.81650    -1.00000                                                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___
|___ \   ___ _   _ _ __ ___  _ __  _   _
  __) | / __| | | | `_ ` _ \| `_ \| | | |
 / __/  \__ \ |_| | | | | | | |_) | |_| |
|_____| |___/\__, |_| |_| |_| .__/ \__, |
             |___/          |_|    |___/
*/

%symdel frompy / nowarn;

%utl_submit_wps64x("
proc python;
submit;
from sympy import *;
import pandas as pd;
x, y = symbols('x, y');
eq1=log(x) + log(y) - log(5);
eq2=(log(x) + 2 * log(y))/2 - log(10);
solution=solve([eq1, eq2], (x, y));
print(solution);
df=pd.DataFrame(solution);
df.info();
df.to_clipboard(index=False,header=False);
endsubmit;
run;quit;
",return=fromPy);

%put &=frompy;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  EQUATIONS                                                                                                             */
/*                                                                                                                        */
/*  log(x) + log(y) - log(5);                                                                                             */
/*  (log(x) + 2 * log(y))/2 - log(10);                                                                                    */
/*                                                                                                                        */
/*                                                                                                                        */
/*  Creates the macro variable frompy in the parent address space                                                         */
/*                                                                                                                        */
/*  eq1=log(x) + log(y) - log(5);                                                                                         */
/*  eq2=(log(x) + 2 * log(y))/2 - log(10);                                                                                */
/*                                                                                                                        */
/*  The WPS PYTHON Procedure                                                                                              */
/*                                                                                                                        */
/*  [x=1/4, y=20)]                                                                                                        */
/*                                                                                                                        */
/*  %put &=frompy;                                                                                                        */
/*                                                                                                                        */
/*  FROMPY=1/4  20                                                                                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/



/*____                                          _           _
|___ /   _ __   _ __  _   _ _ __ ___   ___ _ __(_) ___ __ _| |
  |_ \  | `__| | `_ \| | | | `_ ` _ \ / _ \ `__| |/ __/ _` | |
 ___) | | |    | | | | |_| | | | | | |  __/ |  | | (_| (_| | |
|____/  |_|    |_| |_|\__,_|_| |_| |_|\___|_|  |_|\___\__,_|_|

*/


%symdel fromr / nowarn;

%utl_submit_wps64x('
proc r;
submit;
f1 <- function(d) {
  f <- numeric(2);
  x <- d[1];
  y <- d[2];
  f[1] <- 1+x**2*y**2-x**2-y**2;
  f[2] <- (x-1)*(x-2)*y^2 - 3*(x^2-1)*y + (x+1)*(2*x+1) - 4;
  sum(abs(f));
  };
res<-optim(c(-1, -1), f1)$par;
res;
xs<-as.character(res[1]);
ys<-as.character(res[2]);
xy<-paste(xs,ys,sep="@");
writeClipboard(xy);
endsubmit;
',return=fromr);

%put &=fromr;

/*
FROMR=-0.81649659254164@-0.999999995342389
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* EQUATIONS                                                                                                              */
/*                                                                                                                        */
/* 1+x**2*y**2-x**2-y**2                                                                                                  */
/* (x-1)*(x-2)*y**2 - 3*(x**2-1)*y + (x+1)*(2*x+1) - 4                                                                    */
/*                                                                                                                        */
/*  Requires an initial guess  x=-1, y=-1                                                                                 */
/*                                                                                                                        */
/*  The WPS R System Solution                                                                                             */
/*                                                                                                                        */
/*  [1] -0.8164966 -1.0000000 (matches the third solution from 1st python program)                                        */
/*                                                                                                                        */
/*  Creates the macro variable frompy in the parent address space                                                         */
/*                                                                                                                        */
/*  %put &=fromr;  returns a wps macro variable from r                                                                    */
/*                                                                                                                        */
/*  FROMR =- 0.81649659254164@-0.999999995342389                                                                          */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*  _              _       _           _
| || |    _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
| || |_  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
|__   _| | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
   |_|   |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                   |_|
*/

 REPO
 --------------------------------------------------------------------------------------------------------------------------
 https://github.com/rogerjdeangelis/utl-calculating-the-cube-root-of-minus-one-with-drop-down-to-python-symbolic-math-sympy
 https://github.com/rogerjdeangelis/utl-symbolic-algebraic-simplification-of-a-polynomial-expressions-sympy
 https://github.com/rogerjdeangelis/utl-sympy-technique-for-symbolic-integration-of-bivariate-density-function
 https://github.com/rogerjdeangelis/utl-solving-a-simple-and-complex-non-linear-equation-using-python-and-r
 https://github.com/rogerjdeangelis/utl_symbolic_differential_integral_and_algebraic_mathematics_in_R_and_Python
 https://github.com/rogerjdeangelis/utl_symbolic_determination_of_moments_of_a_beta_like_distribution

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
