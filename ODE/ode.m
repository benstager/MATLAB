function ode

f = @(t,x) -x;
ode23(f,[0,10],2)

