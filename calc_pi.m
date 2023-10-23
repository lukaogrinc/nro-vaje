function calc_pi()
    % Število korakov
    koraki = 100;

    % Naključne točke od 10 do 3000
    stevilo_tock = round(linspace(10, 3000, koraki));

    % Predhodno definirana vrednost za π
    prava_vrednost_pi = pi;

    % Seznam za shranjevanje rezultatov
    izracunane_vrednosti_pi = zeros(size(stevilo_tock));
    napake = zeros(size(stevilo_tock));

    figure; 
    
    % Za plot rezultatov ustvarimo sliko

    for i = 1:length(stevilo_tock)
        % Kličemo mcc_pi brez vračanja rezultatov
        [krog, kvadrat] = mcc_pi(stevilo_tock(i), false);

        % Klic funkcije area_pi za izračun π
        [izracunane_vrednosti_pi(i), napake(i)] = area_pi(krog, kvadrat, prava_vrednost_pi);
    end

    % Povprečna vrednost izračunanih π
    povprecna_vrednost_pi = mean(izracunane_vrednosti_pi);

    % Napaka povprečne vrednosti izračunanih π
    napaka_povprecja = std(izracunane_vrednosti_pi) / sqrt(length(stevilo_tock));

    disp(['Povprečna vrednost π: ' num2str(povprecna_vrednost_pi)]);
    disp(['Napaka povprečne vrednosti π: ' num2str(napaka_povprecja)]);

    % Izrišemo teoretično vrednost π
    plot(stevilo_tock, prava_vrednost_pi * ones(size(stevilo_tock)), 'b--', 'DisplayName', 'pi');
    hold on;
    
    % Nariši črto, ki poveže vse točke
    plot(stevilo_tock, izracunane_vrednosti_pi, '-o', 'Color', 'r', 'Marker', 'none', 'DisplayName','Približki števila pi');

    xlabel('Število točk');
    ylabel('Izračunana vrednost π');
    title('Približevanje izračunane vrednosti π teoretični vrednosti');
    grid on;
    legend('Location', 'Best');
end

% Izločena funkcija area_pi
function [izracunana_vrednost_pi, napaka] = area_pi(krog, kvadrat, prava_vrednost_pi)
    % Število točk znotraj kroga
    tocke_v_krogu = size(krog, 2);
    
    % Število vseh točk v kvadratu
    vse_tocke = size(kvadrat, 2);
    
    % Izračun ocene π
    izracunana_vrednost_pi = 4 * (tocke_v_krogu / vse_tocke);
    
    % Izračun napake
    napaka = abs(prava_vrednost_pi - izracunana_vrednost_pi);
end