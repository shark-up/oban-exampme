defmodule JobsProcessor.Repo do
  use Ecto.Repo,
    otp_app: :jobs_processor,
    adapter: Ecto.Adapters.Postgres
end
