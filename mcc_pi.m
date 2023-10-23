function [krog, kvadrat] = mcc_pi(stevilo_tock, print_results)
    % Preveri če je print argument podan
    if nargin < 2
        print_results = true;
    end

    % Generiraj naključnih točk znotraj enotskega kvadrata
    x = rand(1, stevilo_tock);
    y = rand(1, stevilo_tock);

    % Preveri, ali so točke znotraj kroga
    razdalja = sqrt(x.^2 + y.^2);
    znotraj_kroga = razdalja <= 1;

    % Koordinate točk znotraj kroga
    krog = [x(znotraj_kroga); y(znotraj_kroga)];

    % Koordinate točk znotraj kvadrata
    kvadrat = [x; y];

    % Anonimna funkcija za izračun točk na loku krožnice
    izracunaj_lok = @(krog) sum(abs(sqrt(krog(1,:).^2 + krog(2,:).^2 - 1)) < 2e-1);

    % Klic anonimne funkcije za izračun točk na loku krožnice
    tocke_na_loku = izracunaj_lok(krog);

    % Printa rezultat če, je print_results == true; pomembno za calc_pi
    if print_results
        disp('Točke znotraj kroga:');
        disp(krog');

        disp('Točke znotraj kvadrata:');
        disp(kvadrat');
        
        disp(['Točke na loku krožnice: ' num2str(tocke_na_loku)]);
    end
end
