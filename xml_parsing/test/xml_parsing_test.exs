
defmodule XmlParsingTest do
  use ExUnit.Case
  require Record
  Record.defrecord :xmlElement.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl" )
  Record.defrecord :xmlText.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl" )

  def sample_xml do
    """
    <html>
      <head>
        <title>XML Parsing</title>
      </head>
      <body>
        <p> Neato </p>
        <ul>
          <li>First</li>
          <li>Second</li>
        </ul>
      </body>
    </html>
    """
  end

  test "parsing the title out" do
    { xml, _rest } = :xmerl_scan.string(to_char_list(sample_xml))
    [ title ] = :xmerl_xpath.string('/html/head/title', xml)
    assert title == "XMl Parsing"
  end
end
