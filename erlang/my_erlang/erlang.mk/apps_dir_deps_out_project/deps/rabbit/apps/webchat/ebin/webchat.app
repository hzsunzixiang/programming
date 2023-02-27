{application, 'webchat', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['webchat_app','webchat_sup']},
	{registered, [webchat_sup]},
	{applications, [kernel,stdlib,cowboy]},
	{mod, {webchat_app, []}},
	{env, []}
]}.