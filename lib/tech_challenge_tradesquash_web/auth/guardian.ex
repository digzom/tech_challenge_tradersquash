defmodule TechChallengeTradesquashWeb.Auth.Guardian do
  @moduledoc false
  use Guardian, otp_app: :tech_challenge_tradesquash

  def subject_for_token(author, _claims) do
    sub = to_string(author.id)

    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = TechChallengeTradesquash.Authors.get_author!(id)

    {:ok, resource}
  end
end
