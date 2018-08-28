require 'minitest/autorun'
require 'dynaml'

class DynamlTest < Minitest::Test
  SIMPLE = {
    array: [ { h1: "Dynaml" }, { p: "Dynaml adds dynamic features to your YML/locale files" } ],
    html: %(<h1>Dynaml</h1><p>Dynaml adds dynamic features to your YML/locale files</p>)
  }

  COMPLEX = {
    array: [
      { :"p#title" => "Dynaml" },
      { div: [
        { :"p.description" => "Dynaml adds dynamic features to your YML/locale files" }
      ] }
    ],
    html: %(<p id=\"title\">Dynaml</p><div><p class=\"description\">Dynaml adds dynamic features to your YML/locale files</p></div>),
    html_pretty: %(<p id=\"title\">Dynaml</p>\n<div>\n  <p class=\"description\">Dynaml adds dynamic features to your YML/locale files</p>\n</div>)
  }

  def test_parse_from_array
    suite = SIMPLE
    assert_equal suite[:html], Dynaml.new.parse(suite[:array])
  end

  def test_helper_method
    suite = SIMPLE
    # assert_equal suite[:html], parse_t(suite[:array])
    true
  end

  def test_prettify
    suite = COMPLEX
    # assert_equal suite[:html_pretty], parse_t(suite[:array], pretty: true)
    true
  end
end
