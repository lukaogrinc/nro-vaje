function [krog, kvadrat] = mcc_pi(stevilo_tock, print_results)
    % Check if print_results argument is provided
    if nargin < 2
        print_results = true;
    end

    % Generiraj naključne točke znotraj enotskega kvadrata
    x = rand(1, stevilo_tock);
    y = rand(1, stevilo_tock);

    % Poglej, če so točke v krogu
    razdalja = sqrt(x.^2 + y.^2);
    znotraj_kroga = razdalja <= 1;

    % X in Y koordinate točke v krogu
    krog = [x(znotraj_kroga); y(znotraj_kroga)];

    % X in Y koordinate točk v kvadratu
    kvadrat = [x; y];

    % Če je print_results=true, vrni rezultat
    if print_results
        disp('Točke znotraj kroga:');
        disp(krog');

        disp('Točke znotraj kvadrata:');
        disp(kvadrat');
    end
    % Anonimna funkcija za izračun točk na loku krožnice
    izracunaj_lok = @(krog) size(find(znotraj_kroga), 2);

    % Klic anonimne funkcije za izračun točk na loku krožnice
    tocke_na_loku = izracunaj_lok(krog);
    disp(['Točke na loku krožnice: ' num2str(tocke_na_loku)]);
end