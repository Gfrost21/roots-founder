clc;
syms F(x) fxturunan(x)

F = input ('Masukan F(x) = ');
Xo= input ('masukan nilai Xo = ');
Xr = input ('masukan nilai Xr = ');
e = input('tentukan nilai error= ');


fturunan=diff(F,x);
iterasi = 1;

Xaa= -10;
Xbb= 10;
Fxr= (eval(subs(F, x , Xr)));
Fxo = (eval (subs(F , x , Xo)));
X_values = [];
F_values = [];
X_values = [X_values, Xr];
     F_values = [F_values, eval(subs(F, x , Xr))];


disp(['', num2str(iterasi) '. X = ',num2str(Xr)   ' dengan Y =  ',  num2str((abs(eval(subs(F, x , Xo)))))]);

   while ((abs(eval(subs(F, x , Xo))))) > e

     iterasi = iterasi + 1;
      Fxr= (eval(subs(F, x , Xr)));
      Fxo = (eval (subs(F , x , Xo)));
      
      Xrr= Xr - (   (eval(subs(F, x , Xr))) * (Xr- Xo)    / ((eval(subs(F, x , Xr))) - (eval(subs(F, x , Xo)))));
      Fx = eval(subs(F, x , Xrr)) ;

      Xo=Xr;
      Xr=Xrr;
      Fxo = (eval (subs(F , x , Xr)));
      Fxr =  (eval(subs(F, x , Xrr)));
     
    
     
     disp(['', num2str(iterasi) '. X = ',num2str(Xrr)   ' dengan Y =  ',  num2str(abs(eval(subs(F, x , Xrr)))) ]);
    
     X_values = [X_values, Xr];
     F_values = [F_values, eval(subs(F, x , Xr))];







   end
   disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
       disp(['nilai akar persamaanya adalah  ', num2str(Xrr) ' dan berada di f(x) =  ', num2str(eval(subs(F, x , Xrr)))]);
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
