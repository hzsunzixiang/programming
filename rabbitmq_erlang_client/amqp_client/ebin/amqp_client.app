{application, amqp_client,
 [{description, "RabbitMQ AMQP Client"},
  {vsn, "3.6.2"},
  {modules, ['amqp_connection_sup', 'amqp_gen_connection', 'amqp_channel_sup', 'amqp_gen_consumer', 'amqp_rpc_server', 'amqp_client', 'amqp_sup', 'amqp_main_reader', 'amqp_channel', 'amqp_auth_mechanisms', 'rabbit_routing_util', 'amqp_channels_manager', 'amqp_selective_consumer', 'amqp_direct_connection', 'amqp_channel_sup_sup', 'rabbit_ct_client_helpers', 'amqp_connection_type_sup', 'amqp_uri', 'amqp_direct_consumer', 'uri_parser', 'amqp_network_connection', 'amqp_rpc_client', 'amqp_connection']},
  {registered, [amqp_sup]},
  {env, [{prefer_ipv6, false},
         {ssl_options, []}]},
  {mod, {amqp_client, []}},
  {applications, [kernel, stdlib, xmerl, rabbit_common]}]}.
