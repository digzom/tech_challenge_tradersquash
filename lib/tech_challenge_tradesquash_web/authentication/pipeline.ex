defmodule TechChallengeTradesquashWeb.Authentication.Pipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline,
    otp_app: :tech_challenge_tradesquash,
    error_handler: TechChallengeTradesquashWeb.Authentication.ErrorHandler,
    module: TechChallengeTradesquashWeb.Authentication

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
