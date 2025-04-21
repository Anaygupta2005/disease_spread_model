function Results = SpreadOfDisease(N, a1, a2, b1, b2, c1, c2, DT_bar, NHo, NIo, NCo, NHIo, ND, NSIM)
    
    rng(2025210);
    
    Results = zeros(4*ND, NSIM);

    for sim = 1:NSIM
        NI  = zeros(1,ND);
        NC  = zeros(1,ND);
        NHI = zeros(1,ND);
        NH  = zeros(1,ND);

        m1 = zeros(NHo,1); % healthy not immune
        im1 = zeros(NHo,1); % healthy not immune
        
        m2 = -randi([a1,a2], NIo, 1); % infected
        im2 = zeros(NIo, 1); % infected
        
        m3 = randi([b1,b2], NCo, 1); % contagious
        im3 = zeros(NCo, 1); % contagious
        
        m4 = zeros(NHIo, 1); % healthy immune
        im4 = -randi([c1,c2],NHIo,1); % healthy immune
        
        m = [m1' m2' m3' m4']';
        im = [im1' im2' im3' im4']';

        NI(1)  = sum(m<0);
        NC(1)  = sum(m>0);
        NHI(1) = sum(m==0 & im<0);
        NH(1)  = sum(m==0 & im>=0);
        
        for day = 2:ND
            for interactions = 1:N/2 % exposure loop
                DT = floor(rand + DT_bar);
                if DT == 1 % disease needs to be transmitted
                    I = floor(N*rand) + 1; % select person I 
                    J = floor(N*rand) + 1; % select person J
                    if m(I)>0 && m(J)==0 && im(J)>=0 % infect J if I is contagious, J is healthy not immune
                        m(J) = -(floor((a2-a1+1)*rand) + a1);
                    elseif m(J)>0 && m(I)==0 && im(I)>=0 % infect I if J is contagious, I is healthy not immune
                        m(I) = -(floor((a2-a1+1)*rand) + a1);
                    end
                end
            end
            
            NI(1,day) = sum(m<0);
            NC(1,day) = sum(m>0);
            NHI(1,day) = sum(m==0 & im<0);
            NH(1,day) = sum(m==0 & im>=0);
            
            for i=1:N % update status loop
                if m(i) == 0 % ith person is healthy
                    im(i) = im(i) + 1; % reduce immunity period by 1 day
                elseif m(i)>0 % ith person is contagious
                    m(i) = m(i) - 1; % reduce recuperation period by 1 day
                    if m(i) == 0 % recovered
                        im(i) = -(floor((c2-c1+1)*rand)+c1); % assign immunity period
                    end
                else % ith person is infected, not contagious
                    m(i) = m(i) +1; % reduce incubation period by 1 day
                    if m(i) == 0 % incubation over
                        m(i) = floor((b2-b1+1)*rand)+b1; % assign recuperation period
                    end
                end
            end
        end

        Results(:,sim) = [NI NC NHI NH]';

    end

end

