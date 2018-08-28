# dynaml

Dynaml is a gem which adds conversion from hash/YAML/locales to HTML.

## Usage

Input some YAML:
```yaml
# html.yml
content:
- p#title: "Dynaml"
- div:
  - p.description: "Dynaml adds dynamic features to your YML/locale files"
```

Or an array/hash structure:
```ruby
html_content = [
  { :"p#title" => "Dynaml" },
  { div: [
    { :"p.description" => "Dynaml adds dynamic features to your YML/locale files" }
  ] }
]
```

Use Dynaml:
```ruby
dynaml = Dynaml.new

dynaml.parse(YAML.load(open('html.yml'))["content"])
# or
dynaml.parse(html_content)
```

And get HTML:
```html
<p id="title">Dynaml</p>
<div>
  <p class="description">Dynaml adds dynamic features to your YML/locale files</p>
</div>
```
