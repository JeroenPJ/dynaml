class Dynaml
  ELEM_REGEX  = /([\w]*)(\#|\.|\z)/i
  ID_REGEX    = /#([\w\-\:]*)/i
  CLASS_REGEX = /\.([\w\-\:]*)/i

  def initialize(options = {})
    @pretty = options[:pretty] || false

    @seperator = @pretty ? "\n" : ""
  end

  def tag(name, content, attributes = {})
    %(<#{name}#{tag_attributes(attributes)}>#{content}</#{name}>)
  end

  def parse(content)
    # return content if content.class == ActiveSupport::SafeBuffer

    content.map { |c| parse_part(c) }.flatten.join(@seperator) # .html_safe
  end

  def parse_content_string(string)
    string # I18n.interpolate(string).html_safe
  end

  def to_tag(key, content)
    attributes = key_attributes(key)
    tag(strip_key(key), content, attributes)
  end

  def parse_t(key)
    parse(t(key))
  end

  # private

  def key_attributes(key)
    id = ID_REGEX.match(key)
    cl = CLASS_REGEX.match(key)  # cl = class
    attributes = {}
    attributes[:id]    = id[1] unless id.nil?
    attributes[:class] = cl[1] unless cl.nil?
    attributes
  end

  def strip_key(key)
    match = ELEM_REGEX.match(key)
    if match.nil?
      # raise InvalidKeyError
    else
      match[1]
    end
  end

  def parse_part(part)
    part.map do |element, content|
      content = content.is_a?(String) ? parse_content_string(content) : prettify_content(parse(content))
      to_tag(element, content)
    end
  end

  def tag_attributes(attributes)
    attributes.empty? ? "" : " " + attributes.map { |a, v| %(#{a}="#{v}") }.join(" ")
  end

  def prettify_content(content)
    @pretty ? "\n  #{content}\n" : content
  end
end
