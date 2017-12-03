# LinkOff

LinkOff is a simple web redirector that intercepts requests to click trackers and "you are leaving this site" warning pages, making them seamless and private.

With LinkOff, you can tell trackers to "link off", as it were.

## Why?

Aside from getting really tired of these sorts of "are you sure you want to leave our site?" pages, they're also how those sites track what links you click.

I wouldn't mind the latter so much if not for the former, but I decided I may as well get rid of them both.

## Dependencies

### Erlang and Elixir

LinkOff is written in Elixir, which is a language running on top of Erlang.  You'll need both of these to make it work.

If you follow the [Elixir install instructions](https://elixir-lang.org/install.html), you should end up with both of these.  Most of the automatic (i.e. packaged) installs will automatically install Erlang for you.  The manual install methods include instructions on installing Erlang.

If you're installing the Debian/Ubuntu packages, make sure to include `erlang-dev` (the Erlang headers) and `erlang-tools` (some development tools).  These are needed by LinkOff's dependencies. *(FIXME: verify if this is still true)*

LinkOff was written in Elixir 1.5 running on Erlang 20.  You can try running it under older versions, but there's no guarantees it'll work.

## Installation

### Installing

1. Ensure dependencies are installed; see above.
2. Run `mix deps.get` to fetch the libraries LinkOff needs.
3. Edit `config/link_off.example.exs`, adjust as needed, and save as `config/link_off.exs`.

Now, you have two options on how to run LinkOff:

### Running on the spot

For beginners, I recommend just running `mix linkoff.server`.  This will launch the server right here and now, ready to accept requests.  (To exit the server, press control-C twice.)

By default, it listens on localhost (`127.0.0.1`), port 4242.  If you want to open this up to the world, you'll need to edit your `config/link_off.exs` and set `bind_to_ip` to `0.0.0.0`.  (You may also have to set up port forwarding so the world can reach you.)

### Deploying

The above method should be enough to get you going.  However, if you're an experienced Elixir developer and/or sysadmin, and you want more flexibility, you can try deploying instead.

This is a more complex topic, and is covered in [a separate document](docs/deploying.md).

### Intercepting traffic

**FIXME: TODO**

## Legal stuff

Copyright © 2017, Adrian Irving-Beer.

LinkOff is released under the [Apache 2 License](LICENSE) and is provided with **no warranty**.  Remember, you're deploying a web service that runs commands on your precious Plex server.  I make every effort to write secure code, but you're still using LinkOff at your own risk.
