%% Generate a random 10x10 matrix
a=rand(10)

%% Find maximum elements for each row
bigel=max(a,[],2)

%% Find indices relative to those maximum elements
[a,b]=find(a==bigel)
