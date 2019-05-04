perceptron = Perceptron();

[patterns, expected_outputs] = load_normalized_data('./terrain/terrain03.data');
data_size = size(patterns)(1);

%for testing set
data_test_index = data_size - round((perceptron.percentage * data_size) / 100);

%random initial weights
[w_network, last_w_variation] = random_weights(perceptron.layers, perceptron.neurons_per_layer);

%train with all data
[network_outputs, w_network, epoch_count, saturation, cut_condition] = train_all_data(perceptron, data_size, patterns, expected_outputs, w_network, last_w_variation);

%train with given percentage of the data
%[network_outputs, w_network, epoch_count, saturation, cut_condition] = train_percentage_data(perceptron, data_size, patterns, expected_outputs, w_network, last_w_variation);

%------------------

epoch_count
saturation
cut_condition

accuracy = check_accuracy(network_outputs, expected_outputs, data_size, perceptron.epsilon)
%accuracy of the testing set
%accuracy = check_percentage_accuracy(data_test_index,network_outputs, expected_outputs, data_size, perceptron.epsilon)

%------------------

plot3(patterns(:,1), patterns(:,2), expected_outputs', '.', 'color','red');
hold on
plot3(patterns(:,1), patterns(:,2), network_outputs', '.', 'color', 'blue');