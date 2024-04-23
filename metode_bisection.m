clc;
syms x y H f X Y
F = input ('Masukan F(x) = ');
Xa = input('masukan Xa (batas bawah)   = ');
Xb = input('masukan Xb (batas atas ) = ');
e = input('tentukan nilai error= ');

Xaa=-1000;
Xbb=1000;
Fa = eval(subs(F , x , Xa));
Fb = eval(subs(F , x , Xb));

% Inisialisasi array untuk menyimpan titik-titik pada plot
X_values = [];
F_values = [];

iterasi = 0; % Variabel untuk melacak jumlah iterasi
if Fa * Fb < 0
 while (abs(Xb-Xa)) > e
  iterasi = iterasi + 1;

   X = (Xa + Xb) / 2;
   Fx = eval(subs(F , x , X));
   disp(['', num2str(iterasi) '. X = ',num2str(X)  '  dan F(x)= ', num2str(Fx)]);
     X_values = [X_values, X];
     F_values = [F_values, Fx];
   if (eval(subs(F , x , Xa))) * (eval(subs(F , x , X))) < 0 
      Xb= X;
      Fb=  eval(subs(F , x , X));

   elseif (eval(subs(F , x , Xa))) * (eval(subs(F , x , X))) > 0 
      Xa= X;
      Fa=  eval(subs(F , x , X));
   else
       break ;
   end

 end
 disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
 disp(['nilai akar persamaanya adalah  ', num2str(X) ' dan berada pada titik Y =  ', num2str(Fx)]);
 disp(['jumlah iterasi yang dilakukan: ', num2str(iterasi)]);
else
    disp(['tidak terdapat akar diantara Xa dan Xb']);
end

% Menampilkan plot
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
