

   %
   % Model parameters
     global c ncase
   %
   % Select case
   % ncase=1;
   % ncase=2;
   % ncase=3;
ncase=4; %
   % Model parameters
     if(ncase==1)c=0.9;end
     if(ncase==2)c=0.9;end
     if(ncase==3)c=0.9;end
     if(ncase==4)c=0.9;end

     %
   % Independent variable for ODE integration
     if(ncase==1)
       tf=9;tout=[t0:3:tf]';nout=4;ncall=0;
     end
     if(ncase==2)
       tf=9;tout=[t0:3:tf]';nout=4;ncall=0;
     end
     if(ncase==3)
       tf=9;tout=[t0:3:tf]';nout=4;ncall=0;
     end
     if(ncase==4)
       tf=9;tout=[t0:3:tf]';nout=4;ncall=0;
     end

       figure(3)
       surf(x,t,u1)
       xlabel('x'); ylabel('t'); zlabel('u1(x,t)');
       title('Boussinesq equation');
