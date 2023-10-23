function izrisi_tocke()
    % Število naključnih točk
    stevilo_tock = 10000;

    % Generiraj naključne točke znotraj enotskega kvadrata
    x = rand(1, stevilo_tock);
    y = rand(1, stevilo_tock);

    % Preveri, ali so točke znotraj kroga
    razdalja = sqrt(x.^2 + y.^2);
    znotraj_kroga = razdalja <= 1;

    % definiraj krog
    krog = [x(znotraj_kroga); y(znotraj_kroga)];

    % Anonimna funkcija za izračun, ali so točke na loku krožnice
    izracunaj_lok = @(krog) abs(sqrt(krog(1,:).^2 + krog(2,:).^2 - 1)) < 2e-1;

    % Klic anonimne funkcije za izračun, ali so točke na loku krožnice
    tocke_na_loku = izracunaj_lok(krog);

    % Razdeli točke na tri kategorije
    krog_x = x(znotraj_kroga);
    krog_y = y(znotraj_kroga);
    tocke_na_loku_x = krog_x(tocke_na_loku);
    tocke_na_loku_y = krog_y(tocke_na_loku);
    kvadrat_x = x(~znotraj_kroga);
    kvadrat_y = y(~znotraj_kroga);

    % Ustvari novo sliko
    figure;

    % Riši točke znotraj kroga v rdeči barvi s krogci
    scatter(krog_x, krog_y, 30, 'b', 'filled', 'DisplayName', 'Znotraj kroga');

    hold on; % Nadaljuj risanje na isti sliki

    % Riši točke na loku krožnice v zeleni barvi s krogci
    scatter(tocke_na_loku_x, tocke_na_loku_y, 30, 'g', 'filled', 'DisplayName', 'Na loku krožnice');

    hold on;

    % Riši točke zunaj kroga v modri barvi s kvadrati
    scatter(kvadrat_x, kvadrat_y, 30, 'r', 's', 'filled', 'DisplayName', 'Zunaj kroga');

    % Anonimna funkcija za izris loka krožnice
    n = 100; % Število točk na loku
    theta = linspace(0, 2*pi, n);
    x_circle = cos(theta);
    y_circle = sin(theta);

    % Riši lok krožnice v črni barvi
    plot(x_circle, y_circle, 'k--', 'LineWidth', 2, 'DisplayName', 'Krožnica');

    legend('Location', 'Best');

    % Prikaži rezultat
    axis equal;
    title('Naključno generirane točke in krožnice');
end
