function [network_outputs, w_network, epoch_count, saturation, cut_condition] = train_all_data(perceptron, data_size, patterns, expected_outputs, w_network, last_w_variation)	
	epoch_count = 0;
	cut_condition = 0;
	saturation = 0;

	for ep = 1:perceptron.epochs
		saturation = 0;
		%training
		for training_counter = 1:data_size
			x1 = patterns(training_counter,1);
			x2 = patterns(training_counter,2);
			expected_z = expected_outputs(training_counter);
			input_vector = [-1; x1 ; x2];	

			[h,V] = forward_propagation(input_vector, perceptron.layers, w_network, perceptron.activation);

			%check saturation
			for i=1:perceptron.layers
				for j = 1:size(h{i})(1)
					if h{i}(j,1) > perceptron.saturation_value
						saturation = 1;
					end
				end
			end

			if saturation == 1
				break;
			end

			network_outputs(training_counter) = V{perceptron.layers};

			deltas = calculate_deltas(perceptron.layers, perceptron.activation_d, h, V, expected_z, w_network, perceptron.neurons_per_layer);
			[w_network, last_w_variation] = backward_propagation(input_vector, w_network, perceptron.neurons_per_layer, perceptron.eta, deltas, perceptron.layers, V, last_w_variation, perceptron.momentum_enabled, perceptron.alpha);
		end

		%check saturation
		if saturation == 1
			break;
		else
			[errors, ecm] = calculate_errors(network_outputs, expected_outputs, data_size);

			%set only on first epoch
			if ep == 1
				old_ecm = ecm;
				old_w_network = w_network;
			end

			%check cut condition
			if ecm < perceptron.cut_condition_value
				cut_condition = 1;
				break;
			end

			%adaptative eta
			if perceptron.adaptative_eta_enabled == 1 && rem(ep,perceptron.eta_check_steps) == 0
				if ecm < old_ecm
					perceptron.eta += perceptron.eta_increment;
					perceptron.momentum_enabled = 1;
					old_w_network = w_network;
				elseif ecm > old_ecm
					perceptron.eta -= perceptron.eta_decrement * perceptron.eta;
					perceptron.momentum_enabled = 0;
					w_network = old_w_network;
				end
				old_ecm = ecm;
			end
		end
		epoch_count++;
	end
end