
ExUnit.start()

defmodule TestCatDog do

  @moduledoc """
   The[ head | tail ] of [ 'cat' | 'dog' ] restructed (undestructured?)
   is [[99, 97, 116], 100, 111, 103] and not the equivalent of the intuitive
   [99, 97, 116, 100, 111, 103] which is 'catdog'
  """

  use ExUnit.Case

  test "[ 'cat' | 'dog' ] is unintiutive due to a nested list" do

    #['cat'|'dog'] is not a flat list
    refute ['cat' | 'dog'] == [99, 97, 116, 100, 111, 103]

    #'catdog' is a flat list
    assert 'catdog' == [99, 97, 116, 100, 111, 103]

    #['cat'|'dog'] has a nested list
    assert ['cat' | 'dog'] == [[99, 97, 116], 100, 111, 103]
  end

end