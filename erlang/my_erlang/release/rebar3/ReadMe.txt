ericksun@centos7-dev:~/programming/erlang/my_erlang/release/example-package/ernie (master)$ rebar3 help shell
Start a shell with project and deps preloaded similar to
'erl -pa ebin -pa deps/*/ebin'.

Usage: rebar3 shell [--config <config>] [--name <name>] [--sname <sname>]
                    [--setcookie <setcookie>] [--script <script_file>]
                    [--apps <apps>] [-r <relname>] [-v <relvsn>]
                    [--start-clean <start_clean>] [--env-file <env_file>]
                    [--user_drv_args <user_drv_args>]

  --config         Path to the config file to use. Defaults to {shell,
                   [{config, File}]} and then the relx sys.config file if
                   not specified.
  --name           Gives a long name to the node.
  --sname          Gives a short name to the node.
  --setcookie      Sets the cookie if the node is distributed.
  --script         Path to an escript file to run before starting the
                   project apps. Defaults to rebar.config {shell,
                   [{script_file, File}]} if not specified.
  --apps           A list of apps to boot before starting the shell. (E.g.
                   --apps app1,app2,app3) Defaults to rebar.config {shell,
                   [{apps, Apps}]} or relx apps if not specified.
  -r, --relname    Name of the release to use as a template for the shell
                   session
  -v, --relvsn     Version of the release to use for the shell session
  --start-clean    Cancel any applications in the 'apps' list or release.
  --env-file       Path to file of os environment variables to setup
                   before expanding vars in config files.
  --user_drv_args  Arguments passed to user_drv start function for
                   creating custom shells.

