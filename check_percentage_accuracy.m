function accuracy = check_percentage_accuracy(index, network_outputs, expected_outputs, data_size, epsilon)
	accuracy = 0;
	for r = index:data_size
		if abs(network_outputs(r) - expected_outputs(r)) < epsilon
			accuracy++;
		end
	end
	accuracy = accuracy / (data_size - index + 1); 
end