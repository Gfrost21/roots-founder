clc;
syms F(x) fxturunan(x)

F = input ('Masukan F(x) = ');
Xr = input ('masukan nilai Xr = ');
e = input('tentukan nilai error= ');


fturunan=diff(F,x);
iterasi = 1;
disp(['', num2str(iterasi) '. X = ',num2str(Xr)   ' dengan e =  ',  num2str((abs(eval(subs(F, x , Xr)))))]);

Xaa= -10;
Xbb= 10;

X_values = [];
F_values = [];
X_values = [X_values, Xr];
     F_values = [F_values, eval(subs(F, x , Xr))];
while ((abs(eval(subs(F, x , Xr))))) > e

     iterasi = iterasi + 1;
      
     Xrr= Xr - (   (eval(subs(F, x , Xr)))   / (eval(subs(fturunan , x , Xr))));
     Fx = eval(subs(F, x , Xr)) ;
     
     Xsebelum= Xr;
     Xr = Xrr;
     disp(['', num2str(iterasi) '. X = ',num2str(Xr)   ' dengan e =  ',  num2str(abs(eval(subs(F, x , Xrr)))) ]);

     X_values = [X_values, Xr];
     F_values = [F_values, eval(subs(F, x , Xr))];
end

 disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
       disp(['nilai akar persamaanya adalah  ', num2str(Xr) ' dan berada di f(x) =  ', num2str(eval(subs(F, x , Xr)))]);
       disp(['jumlah iterasi yang dilakukan: ', num2str(iterasi )]);
       

figure;

plot(X_values, F_values, '-o'); % '-o' untuk membuat plot sebagai garis-garis yang dihubungkan dengan marker lingkaran
title('Plot Fungsi');

hold on;
fplot(F, [Xaa , Xbb]); % Gambar fungsi dari Xa hingga Xb
hold off;
grid on
xlabel('Nilai X');
ylabel('Nilai F(X)');
title('Plot Fungsi')
