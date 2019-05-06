function plot_obtained_output(patterns, output)
	net_size = columns(output.test_network_outputs);
	patterns_size = rows(patterns);
	plot3(patterns(patterns_size-net_size+1:patterns_size,1), patterns(patterns_size-net_size+1:patterns_size,2), output.test_network_outputs, '.', 'color', 'blue');
	title ("Terrain");
	legend ("Generated terrain");
end