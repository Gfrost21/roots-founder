clc;
syms x y H f X Y


f = input ('masukan fungsi F(x)= ');
N = input ('masukkan banyaknya bagian = ');
Xa = input('masukan Xa (batas bawah) = ');
Xb = input('masukan Xb (batas atas ) = ');
X_values = zeros(1, N+1);
Y_values = zeros(1, N+1);

disp('Iterasi ke- Titik');

for r = 0:N
    H = (Xa - Xb) / N;
    X = Xb + r*H;
    Y = eval(subs(f, [x], [X]));
    X_values(r+1) = X;
    Y_values(r+1) = Y;
    disp(['-------------------------------------------------------------------------------------------------------------------------------------------------------------']);
    disp([num2str(r), '        x = ', num2str(X), '   y = ', num2str(Y)]);
end


plot(X_values, Y_values, '-o' )
grid on
xlabel('Nilai X')
ylabel('Nilai Y')
title('Plot Iterasi')
hold on;
fplot(f, [Xa , Xb]);
hold off;
grid on
title('Plot Fungsi')