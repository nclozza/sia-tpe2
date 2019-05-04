function accuracy = check_accuracy(network_outputs, expected_outputs, data_size, epsilon)
	accuracy = 0;
	for r = 1:data_size
		if abs(network_outputs(r) - expected_outputs(r)) < epsilon
			accuracy++;
		end
	end
	accuracy = accuracy / data_size; 
end