% No. of games played
n =[1,5,10,25,50,100,200,500,1000,5000,10000,100000,1000000];

doors = [1,2,3];
win_count = zeros(size(n));

for k = 1:size(n,2)
    % For each game
    for i = 1:n(k)

        doors_with_donkey = [];
        car_loc = randi([1,3],1,1); % Location of car
        inp = randi([1,3],1,1);     % Initial choice if the player
        for j = 1:3
            if doors(j) ~= car_loc
                doors_with_donkey = [doors_with_donkey, doors(j)]; % Doors with a donkey behind
            end
        end
        monty_choice = 0;
        for j=1:3
            if j~=inp
                if any(doors_with_donkey(:) == j)
                    monty_choice = j;       %Monty chooses the door from the 
                end                         %two doors other than the input
            end                             %behind which there's a donkey
        end                                 

        switch_loc = 0;
        for j = 1:3
            if j~=monty_choice && j~=inp
                switch_loc = j;             %Door to which the player can 
            end                             %switch to after hearing Monty's
        end                                 %proposal

        if switch_loc == car_loc
            win_count(k) = win_count(k) + 1;      %Games where the player wins if he
        end                                       %switches
        
    end
    win_count(k) = win_count(k)*100/n(k);
end
plot(n, win_count,'r-', 'linewidth', 1.5)
% Results: win percentage = [0  60.000000000000000  70.000000000000000  52.000000000000000  66.000000000000000  60.000000000000000
%71.000000000000000  63.799999999999997  69.099999999999994  66.219999999999999  66.670000000000002  66.834000000000003
%66.749799999999993]

       
