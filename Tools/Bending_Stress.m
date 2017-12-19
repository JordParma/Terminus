%Computes maximum bending tensile stress in psi at the inner radius of a
%curved beam with applied loaf, F, (lbs).

%r_i = inner radius.
%r_o = outer radius.
%r_n = radius of neutral axis
%r_c = radius of centroidal axis.
%b   = thickness of curved beam, constant.
%M_y = bending moment located at centroidal axis.
%h   = width of differential element (depth of section cut).
%c_o = distance to nuetral axis from outer fiber.
%c_i = distance from nuetral axis to inner fiber.
%e   = distance from centroidal axis to neutral axis.

F = input('enter value for applied load:');     %inches
b = input('enter value for thickness of beam:');%inches
h = input('enter value for depth of section:'); %inches
r_i   = 2:1:20;                                 %inches
r_o   = r_i + 2;                                %inches
A     = h * b;                                  %inches^2
r_c   = r_i + (0.5*(h));                        %inches
r_n   = h./(log(r_o./r_i));                     %inches
e     = r_c - r_n;                              %inches
M_y   = (F*r_c).*(r_n - r_i);                   %psi

%Computes bending tensile stress (at inner radius) for r_i:1:20
sig   = ((F/A)+((M_y)./(A*e.*r_i)))*(10^(-3)); %ksi

xmarkers = r_i;
ymarkers = sig;

T = table(sig',r_i','VariableNames',{'Stress','Radius'})
figure
%Plots beding tensile stress as a function of increasing radius r_i
plot(r_i,sig,'b',xmarkers,ymarkers,'b*')
title('Tensile Stress vs Inner radius');
xlabel('Radius r, [in]')
ylabel('Stress sigma [ksi]');
xmarkers = r_i;
ymarkers = sig;
grid on





