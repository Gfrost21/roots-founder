clc;
syms G(x) Gxturunan(x) Y y x Xsebelum

F = input ('Masukan F(x) = ');
G = input ('masukan G(x) = ');
Xr = input ('masukan nilai Xr = ');
e = input('tentukan nilai error= ');


Xawal = Xr;
iterasi = 1;
Xaa= -10;
Xbb= 10;
X_values = [];
F_values = [];
 disp(['', num2str(iterasi) '. X = ',num2str(Xr)   ' dengan e =  ',  num2str(abs((eval(subs( G, x , Xr))) - Xr)) '  dan berada pada F(x)= ', num2str(eval(subs(F, x , Xr)))]);

while (abs((eval(subs(G , x , Xr))) - Xr))>e
 iterasi = iterasi + 1;

 
 Fx = eval(subs(F, x , Xr));


 Xsebelum = Xr ;
 Xr = eval(subs(G , x , Xr)); 

   disp(['', num2str(iterasi) '. X = ',num2str(Xr)   ' dengan e =  ',  num2str(abs((eval(subs(G , x , Xr))) - Xr)) '  dan berada pada F(x)= ', num2str(eval(subs(F, x , Xr)))]);
 X_values = [X_values, Xsebelum];
 F_values = [F_values, Fx];
end



Gxturunan = diff(G,x);
Gturunan = eval(subs(Gxturunan , x , Xawal));


if Fx == Inf



  if  (Gturunan) > 1

    disp('merupakan divergen monoton')   ;
    disp([' 1 <  G^-1(x)= ', num2str((eval(subs(Gxturunan , x , Xawal))))]);
  else
    disp('merupakan divergen berosilasi');

  end



else
    if  (0< (Gturunan))  &    ((Gturunan)< 1)
       disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
       disp(['nilai akar persamaanya adalah  ', num2str(Xr) ' dan berada pada titik Y =  ', num2str(eval(subs(F, x , Xr)))]);
       disp(['jumlah iterasi yang dilakukan: ', num2str(iterasi)]);
       disp(['Merupakan konvergen monoton']);
       disp([' 0 <  G^-1(x)= ', num2str((eval(subs(Gxturunan , x , Xawal))))  ' < 1 ']);
    elseif  (-1<  (Gturunan))  &    ((Gturunan)< 0)
         disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
       disp(['nilai akar persamaanya adalah  ', num2str(Xr) ' dan berada pada titik Y =  ', num2str(eval(subs(F, x , Xr)))]);
       disp(['jumlah iterasi yang dilakukan: ', num2str(iterasi)]);
       disp(['Merupakan konvergen berosilasi']);
       disp(['-1 < G^-1(x)= ', num2str((eval(subs(Gxturunan , x , Xawal))))   ' < 0 ']);
    else

     if  (Gturunan) > 1

    disp('merupakan divergen monoton')   ;
    disp([' 1 <  G^-1(x)= ', num2str((eval(subs(Gxturunan , x , Xawal))))]);
     else
    disp('merupakan divergen berosilasi');

     end
    end

end


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
