classdef Perceptron
	properties

		%layers: counting hidden layers and the output layer
		layers = 3;
		%neurons_per_layer: counting the input layer, hidden layers and the output layer
		neurons_per_layer = [2,30,30,1];

		%activation function and its derivative
		activation = @tanh;
		activation_d = @(x)(1 - x.^2);
		%activation = @(x)(1./(1 + exp(-x)));
		%activation_d = @(x)(x.*(1-x));
		
		saturation_value = 10000;
		cut_condition_value = 0.002;
		epsilon = 0.05;

		momentum_enabled = 1; 
		alpha = 0.5;

		eta = 0.01;
		adaptative_eta_enabled = 0;
		eta_check_steps = 10;
		eta_increment = 0.005;
		eta_decrement = 0.5;

		epochs = 500;
		percentage = 70;
	
	end

	methods
	
	function this = Perceptron()
	end

	end
end