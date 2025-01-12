clc
load vibrations
%%
data = sp1000.SpectrumData;
vector = data(1, 1, :);  % Extract the data along the third dimension
f = sp1000.Frequency;
vector = reshape(vector, [], 1);  % Reshape into a column vector
plot(f,vector)