# dynaml

Dynaml is a gem which adds conversion from hash/YAML/locales to HTML.

## Usage

Input some YAML:
```yaml
content:
- p#title: "Dynaml"
- div:
  - p.description: "Dynaml adds dynamic features to your YML/locale files"
```

Or a array/hash structure:
```ruby
content = [
  { :"p#title" => "Dynaml" },
  { div: [
    { :"p.description" => "Dynaml adds dynamic features to your YML/locale files" }
  ] }
]
```

Use Dynaml:
```ruby
dynaml = Dynaml.new

dynaml.parse(YAML.load(open(filename))["content"])
# or
dynaml.parse(content)
```

And get HTML:
```html
<p>Visit us at https://www.lushed.co/dynaml</p>
<p id="title">Dynaml</p>
<div>
  <p class="description">Dynaml adds dynamic features to your YML/locale files</p>
</div>
```
