import torch
from torch import nn
import torchvision.transforms as transforms

class NN(nn.Module):
    # TODO: Add convolutional parameter and layers
    def __init__(self, input_dim, output_dim, n_hidden_layers, neurons_per_layer):
        self.input_dim = input_dim
        self.output_dim = output_dim
        self.n_hidden_layers = n_hidden_layers
        self.neurons_per_layer = neurons_per_layer

        # Model architecture
        super(NN, self).__init__()
        
        # Create input layer
        # TODO: For Dense NN:
        # Check if input is more than 1 dimension and flatten if 
        # needed. This is in case we are using image frames as input.
        self.input_layer = nn.Sequential(
            nn.Linear(input_dim, neurons_per_layer),
            nn.ReLU()
        )
        
        # Create hidden layers
        hidden_layers = []
        for _ in range(n_hidden_layers):
            hidden_layers.append(nn.Linear(neurons_per_layer, neurons_per_layer))
            hidden_layers.append(nn.ReLU())
        self.hidden_layers = nn.Sequential(*hidden_layers)
        del(hidden_layers)

        # Create output layer
        self.output_layer = nn.Sequential(
            nn.Linear(neurons_per_layer, output_dim)
        )
        

    def forward(self, x):
        """ Forward pass through network
        """
        # TODO: Add check for convolutional layers
        x = self.input_layer(x)
        x = self.hidden_layers(x)
        x = self.output_layer(x)
        return x

