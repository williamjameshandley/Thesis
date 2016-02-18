with(Physics):

# 1st order
Setup(mathematicalnotation=true);
Setup(coordinatesystems = cartesian);
#Setup(spacetimeindices = lowercaselatin);

#PDEtools:-declare(phi(X));
#PDEtools:-declare(psi(X));

# note that h is a 'small parameter' for selecting first order terms

# define the metric
ds2_FRW := (1+2*h*phi(X))*dt^2 - a(t)^2*(1-2*h*psi(X))*(dx^2 + dy^2 + dz^2);
Setup(metric=ds2_FRW);
# define the stress-energy tensor
T[~mu,nu] = 
D_[~mu](f(t)+h*df(X)).D_[nu](f(t)+h*df(X)) 
- ( 
1/2*D_[~alpha](f(t)+h*df(X)).D_[alpha](f(t)+h*df(X)) 
- V(f(t)+h*df(X)) 
) 
. KroneckerDelta[~mu,nu] :
Define(%);

# define some simplifying commands
subsH:= expr -> expand(subs({diff(a(t),t)=H(t)*a(t)},expr));
first_order := expr -> coeff(taylor(expr,h,2),h);
zero_order := expr -> subs(h=0,expr);



T[~4,4]:
expand(first_order(%));
T[~4,1]:
first_order(%);
T[~1,1]:
first_order(%);
