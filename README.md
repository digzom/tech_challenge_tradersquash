# Tech Challenge Tradersquash

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Generate a guardian secret with `mix guardian.gen.secret`
  * Export the key as a secret key environment variable: `export GUARDIAN_SECRET_KEY`
    * Optionally, you can just run `export GUARDIAN_SECRET_KEY=$(mix guardian.gen.secret)`
  * Install node dependencies with `npm install --prefix assets`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
