function calc_pi()
    % Število korakovv
    koraki = 100;

    % Naraščajoče število naključnih točk
    stevilo_tock = round(linspace(10, 4000, koraki));

    % Predhodno definirana vrednost za π
    prava_vrednost_pi = pi;

    % Seznam za shranjevanje rezultatov
    izracunane_vrednosti_pi = zeros(size(stevilo_tock));
    napake = zeros(size(stevilo_tock));

    figure; % Ustvarimo novo sliko za risanje rezultatov

    for i = 1:length(stevilo_tock)
        % Kličemo mcc_pi za trenutno število točk, kjer
        % uporabimoprint_results == false, da ne sprinta rezultata
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

    % Izrišemo konstantno teoretično vrednost π
    plot(stevilo_tock, prava_vrednost_pi * ones(size(stevilo_tock)), 'b--', 'DisplayName', 'pi');
    hold on;
    
    % Plot the line connecting all the calculated points
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
