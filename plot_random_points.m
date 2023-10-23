function plot_random_points()
    % Število naključnih točk
    stevilo_tock = 1000;

    % Generiraj naključne točke znotraj enotskega kvadrata
    x = rand(1, stevilo_tock);
    y = rand(1, stevilo_tock);

    % Preveri, ali so točke znotraj kroga
    razdalja = sqrt(x.^2 + y.^2);
    znotraj_kroga = razdalja <= 1;

    % Koordinate točk znotraj kroga in zunaj kroga
    krog_x = x(znotraj_kroga);
    krog_y = y(znotraj_kroga);
    kvadrat_x = x(~znotraj_kroga);
    kvadrat_y = y(~znotraj_kroga);

    % Ustvari novo sliko
    figure;

    % Riši točke znotraj kroga v rdeči barvi s krogci
    scatter(krog_x, krog_y, 30, 'r', 'filled', 'DisplayName', 'Znotraj kroga');

    hold on; % Nadaljuj risanje na isti sliki

    % Riši točke zunaj kroga v modri barvi s kvadrati
    scatter(kvadrat_x, kvadrat_y, 30, 'b', 's', 'filled', 'DisplayName', 'Zunaj kroga');

    % Anonimna funkcija za izris loka krožnice
    n = 100; % Število točk na loku
    theta = linspace(0, 2*pi, n);
    x_circle = cos(theta);
    y_circle = sin(theta);

    % Riši lok krožnice v črni barvi
    plot(x_circle, y_circle, 'k--', 'LineWidth', 2, 'DisplayName', 'Krožnica');



    % Prikaži rezultat
    axis equal;
    title('Naključno generirane točke in krožnica');
end
