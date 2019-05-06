function plot_expected_and_obtained_outputs(patterns, expected_outputs, output)
	net_size = columns(output.test_network_outputs);
	patterns_size = rows(patterns);
	plot3(patterns(patterns_size-net_size+1:patterns_size,1), patterns(patterns_size-net_size+1:patterns_size,2), output.test_network_outputs, '.', 'color', 'blue');
	title ("Terrain");
	legend ("Generated terrain");
	hold on
	plot3(patterns(:,1), patterns(:,2), expected_outputs', '.', 'color','red');
end