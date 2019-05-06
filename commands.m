%-----------------------------
%---Initialization commands---
%-----------------------------

%param: number of configuration file
perceptron = Perceptron('08');

[patterns, expected_outputs] = load_normalized_data(perceptron.data_file);
data_size = size(patterns)(1);

%random initial weights
[w_network, last_w_variation] = random_weights(perceptron.layers, perceptron.neurons_per_layer);

output = Output(w_network);

%-----------------------
%---Training commands---
%-----------------------

%train with all data
%output = train_all_data(perceptron, output, data_size, patterns, expected_outputs, w_network, last_w_variation);

%train with given percentage of the data
output = train_percentage_data(perceptron, output, data_size, patterns, expected_outputs, w_network, last_w_variation);


%-----------------------
%---Testing commands---
%-----------------------

output = test_all_data(perceptron, output, data_size, patterns, expected_outputs);
output = test_non_trained_data(perceptron, output, data_size, patterns, expected_outputs);


%--------------------------------
%---Metrics and Plots commands---
%--------------------------------

get_training_metrics(output);
get_testing_metrics(output);
plot_expected_and_obtained_outputs(patterns, expected_outputs, output);
plot_obtained_output(patterns, output);
%plot_eta_variation(output);
%plot_ecm_variation(output);
