function b = B_dipole(t,p)
%B_DIPOLE Compute analytic value of magnetic field due to a dipole 
%
%   b = B_DIPOLE(p) Returns the magnetic field b at points p due to a
%   magnetic dipole at the origin that points along the z-axis.
%
%   If x = p(:,1); y = p(:,2); z = p(:,3);  
%     rn5 = 1./sqrt(x.*x + y.*y + z.*z); % r to the negative five
%     bx = 3*x.*z.*rn5
%     by = 3*y.*z.*rn5;
%     bz = (3*z.*z - r.*r).*rn5;
%   and b = [bx,by,bz].
%
%   To complete the calculation, multiply b by the dipole moment.  
%  
%   For Earth, Mz is currently approximately 8e15 T*m^3.  The equation of
%   the dipole magnetic-field lines in spherical coordinates is given by
%   r=ro*(sin(theta)).^2.  If R = r/R_Earth, L = ro/R_Earth, lamda =
%   90-theta (magnetic latitude), and R = L*(cos(lambda))^2, the invariant
%   latitude (where field line crosses Earth's surface) is lambda_I =
%   acos(1/sqrt(L)) .
%
%   Not that for use in ODE integration function, you may pass an
%   arbitrary first argument and set p as the second argument:
%
%   b = B_DIPOLE(t,p) will return the same b as B_DIPOLE(p). 
%  
%   See also BIOT_SAVART_DEMO, B_WIRE, B_RING.


if (nargin == 1)
  p = t;
end
if (nargin == 2) && (size(p,2) == 1)
  p = p';
  transpose_b = 1;
else
  transpose_b = 0;
end

r = magrows(p);
rn5 = r.^(-5);
b(:,1) = 3*p(:,1).*p(:,3).*rn5;
b(:,2) = 3*p(:,2).*p(:,3).*rn5;
b(:,3) = (3*p(:,3).*p(:,3) - r.*r).*rn5;

if (transpose_b == 1)
  b = b';
end


