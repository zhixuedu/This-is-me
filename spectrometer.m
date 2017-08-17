start=30; finish=65;
planc=6.6*10^(-34);

T_lamp=3187; %kelvin
load('gl_spec.mat')
load('sample2')
wl=wl_gl_spec(start:finish);
SR=SR_gl_spec(start:finish);
lamp=lamp_gl_spec(start:finish);
sample=VarName2(start:finish);
sample_c=(lamp./SR).*sample;

wien= 1.38/1.99*100*log(2*pi*planc*9*(10^16)./sample_c./(wl.^5)*10^45);
inv_wl=10^9./wl;
X_reg=[inv_wl ones(size(inv_wl))];
[in_T,bint] =regress(wien,X_reg);
T=1/in_T(1,1);

%figure (1);
%plot(wl,SR);

figure (2)
plot(wl,sample_c);

figure (3)
plot(10^9./wl, wien);