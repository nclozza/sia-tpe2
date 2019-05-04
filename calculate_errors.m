function [errors, ecm] = calculate_errors(network_outputs, expected_outputs, data_size)
	ecm = 0;
	for er = 1:data_size
		errors(er) = (network_outputs(er) - expected_outputs(er))**2;
		ecm = ecm + errors(er);
	end
	ecm = ecm / data_size;
end