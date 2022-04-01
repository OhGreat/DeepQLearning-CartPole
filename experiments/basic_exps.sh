#!/bin/bash

# MLP base 
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 1 \
-batch_size 1 \
-n_episodes 1000 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_base ;

# MLP + buffer 64
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 100000 \
-batch_size 64 \
-n_episodes 1000 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_64 ;

# MLP + buffer 128
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 100000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_128 ;

# MLP + buffer 256
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 100000 \
-batch_size 256 \
-n_episodes 1000 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_256 ;

# MLP + target_model tm_wait 10
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 1 \
-batch_size 1 \
-n_episodes 1000 \
-target_model \
-tm_wait 10 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_10 ;

# MLP + target_model tm_wait 100
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 1 \
-batch_size 1 \
-n_episodes 1000 \
-target_model \
-tm_wait 100 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_100 ;

# MLP + target_model tm_wait 1000
python experiment.py \
-net mlp \
-loss mse \
-optimizer adam \
-optim_lr 1e-3 \
-rb_size 1 \
-batch_size 1 \
-n_episodes 1000 \
-target_model \
-tm_wait 1000 \
-gamma 0.99 \
-policy egreedy \
-epsilon 0.02 0.99 200. \
-run_name MLP_buffer_1000 ;

# CNN base
python experiment.py \
-use_img \
-net cnn \
-loss mse \
-optimizer adam \
-optim_lr 1e-4 \
-rb_size 5000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-target_model \
-tm_wait 10 \
-policy egreedy \
-epsilon 0.025 0.99 400. \
-virtual_display \
-run_name CNN_base ;

# CNN curiosity
python experiment.py \
-use_img \
-net cnn \
-loss mse \
-optimizer adam \
-optim_lr 1e-4 \
-rb_size 5000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-target_model \
-tm_wait 10 \
-policy egreedy \
-epsilon 0.025 0.99 400. \
-intr_rew curiosity-based \
-virtual_display \
-run_name CNN_curiosity ;

# CNN novelty
python experiment.py \
-use_img \
-net cnn \
-loss mse \
-optimizer adam \
-optim_lr 1e-4 \
-rb_size 5000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-target_model \
-tm_wait 10 \
-policy egreedy \
-epsilon 0.025 0.99 400. \
-intr_rew novelty-based \
-virtual_display \
-run_name CNN_novelty ;

# CNN dueling
python experiment.py \
-use_img \
-net cnn \
-loss mse \
-optimizer adam \
-optim_lr 1e-4 \
-rb_size 5000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-target_model \
-tm_wait 10 \
-policy egreedy \
-epsilon 0.025 0.99 400. \
-dueling \
-virtual_display \
-run_name CNN_dueling ;

# CNN double
python experiment.py \
-use_img \
-net cnn \
-loss mse \
-optimizer adam \
-optim_lr 1e-4 \
-rb_size 5000 \
-batch_size 128 \
-n_episodes 1000 \
-gamma 0.99 \
-target_model \
-tm_wait 10 \
-policy egreedy \
-epsilon 0.025 0.99 400. \
-double_dql \
-virtual_display \
-run_name CNN_double ;