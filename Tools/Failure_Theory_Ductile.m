%Applys  distortion-energy (DE) theory and maximum-shear-stress theory to 
%A ductile material. Assumes yield strength is equal to critical shear
%stress, that is (Syt == Syc).

s1 = input('Enter sigma x: ');
s2 = input('Enter sigma y: ');
txy = input('Enter tau xy: ');
Sy = input('Enter yield strength: ');

s3 = 0;

%two nonzero principal stresses are both positive, ?max from largest Mohr’s 
%circle--incorporate the third principle stress at zero.
if (s1 > 0) && (s2 > 0)
    t_max = (s1 - s3)/2;
    n1 = (Sy/2)/(t_max);
    z1 = (s1 +s2)/2 + sqrt(((s1-s2)/2)^2 + txy^2);
    z2 = (s1 +s2)/2 - sqrt(((s1-s2)/2)^2 + txy^2);
    a = sqrt((z1)^2 - z1 * z2 +(z1)^2);
    n2 = Sy/a;
%Two nonzero principal stresses are equal, ?_max from the largest Mohr’s 
%circle--ncorporate the third principal stress at zero.
else
    if (s1 == s2)
    t_max = (s1 - s3)/2;
    n1 = (Sy/2)/(t_max);
    s3 = 0;
    a = sqrt((s1)^2-(s1)*(s1)+(s1)^2);
    n2 = Sy/a;
    else
        %Positive non-zero p_stress ?max cobtained from the extreme-value shear stress
        if (s1 == 0) && (s2 > 0)
        t_max = sqrt(((s1-s2)/2)^2 + txy^2);
        n1 = (Sy/2)/(t_max);
        s3 = 0;
        a = sqrt((s1)^2-(s1)*(s2)+(s2)^2+(3*(txy)^2));
        n2 = Sy/a;
        else
            if (s1 > 0) && (s2 == 0)
            t_max = sqrt(((s1-s2)/2)^2 + txy^2);
            n1 = (Sy/2)/(t_max);
            s3 = 0;
            a = sqrt((s1)^2-(s1)*(s2)+(s2)^2+(3*(txy)^2));
            n2 = Sy/a;
            else
                if (s1 < 0) && (s2 < 0)
                 z1 = (s1 +s2)/2 + sqrt(((s1-s2)/2)^2 + txy^2);
                 z2 = (s1 +s2)/2 - sqrt(((s1-s2)/2)^2 + txy^2);
                 a = sqrt((z1)^2 - z1*z2 + (z2)^2);
                 n2 = Sy/a;
                 s1 = 0;
                 s3 = z2;
                 t_max = (s1 - s3)/2;
                 n1 = (Sy/2)/(t_max);
            else
                 s3 = 0;
                 t_max = (s1 - s3)/2;
                 n1 = (Sy/2)/(t_max);
                 z1 = (s1 +s2)/2 + sqrt(((s1-s2)/2)^2 + txy^2);
                 z2 = (s1 +s2)/2 - sqrt(((s1-s2)/2)^2 + txy^2);
                 a = sqrt((z1)^2 - z1*z2 + (z2)^2);
                 n2 = Sy/a;   
                 t_max = (s1 - s3)/2;
                 n1 = (Sy/2)/(t_max);
                end
            end
        end
    end
end
fprintf('\n');
fprintf('MSS factor of saftey is: %3.3f \n', n1);
fprintf('DET factor of saftey is: %3.3f \n', n2);
