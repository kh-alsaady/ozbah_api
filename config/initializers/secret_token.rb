# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
<<<<<<< HEAD
OzbahApi::Application.config.secret_token = 'd2bae3dab409466f92f40b0ab702ad4f64cf9e271c610c2b4098f5655c0168a2a4fcc65a32d3b5ed0f776198fb0dc2cc325d5215c5d541c576bc856eafbd68f3'
=======
OzbahApi::Application.config.secret_token = '1882a043afaafbcca3b5937c6c1140df8d9d69cf683f92fb62d141e9c3502dfccd8e9f141fda15feebb456079499b71b6ca5a3696d57f8d4a548bc35be2ebd9a'
>>>>>>> 594aa6ae3826869849d270ce17caa5df865833c6
