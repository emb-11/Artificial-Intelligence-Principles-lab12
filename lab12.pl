% Directed edges between cities
edge('Dammam', 'Qatif').
edge('Dammam', 'Riyadh').
edge('Qatif', 'Madinah').
edge('Qatif', 'Dammam').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Makkah', 'Madinah').
edge('Makkah', 'Riyadh').
edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').
edge('Riyadh', 'Dammam').

% Main predicate: travel(From, To, Path)
travel(From, To, Path) :-
    find_path(From, To, [From], RevPath),
    reverse(RevPath, Path).

% Base case: reached destination
find_path(To, To, Visited, Visited).

% Recursive step: find an unvisited next city and proceed
find_path(Current, To, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),        % avoid infinite loops / cycles
    find_path(Next, To, [Next|Visited], Path).
