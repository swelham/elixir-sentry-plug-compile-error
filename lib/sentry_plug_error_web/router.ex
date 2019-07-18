defmodule SentryPlugErrorWeb.Router do
  use SentryPlugErrorWeb, :router

  use Sentry.Plug

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", SentryPlugErrorWeb do
    pipe_through(:api)
  end
end
