defmodule Crypto do
  def md5(data) do
    Base.encode16(:erlang.md5(data), case: :lower)
  end
end

defmodule AOC2015.Day04 do

  def solve(key) do
    key |> find_hash
  end

  defp find_hash(key, counter \\ 7, index \\ 0) do
    hash = Crypto.md5 "#{key}#{index}"
    if String.starts_with?(hash, "00000") do
        if counter == 0 do
          index
        else
          find_hash(key, counter - 1, index)
        end
    else
      find_hash(key, counter, index + 1)
    end
  end

end


AOC2015.Day04.solve("bgvyzdsv") |> IO.puts