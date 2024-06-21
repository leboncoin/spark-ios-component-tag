# Tag
Tags are used to label content and help users quickly recognize info about them: Categories, Status... Can be applied with different colors and designs that are associated with a content due to its characteristics: new content, unvisited content, featured content... Users can’t interact with Tags.

## Specifications
The tag specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/295e88-tag).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-tag/blob/main/.github/assets/anatomy.png)

## Usage
Tag is available both in UIKit and SwiftUI. 

### TagUIView
Parameters:
* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The intent of the tag, e.g. main, support
* `variant`: The tag variant, e.g. `outlined`, `filled`, `tinted`.
* `iconImage`: An icon used in tag.
* `text`: The text of the tag.
* `attributedText`: The attributed text of the tag.

**Note**: you can use Tag with text and/or icon. But one of these properties is a must have!

### TagView
Parameters:
* `theme`: The current Spark-Theme. [You can always define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)

Default values:
* `intent`: `.main`.
* `variant`: `.filled`.
* `iconImage`: `nil`.
* `text`: `nil`.
* `attributedText`: `nil`.

Modifiers:
* `.intent(TagIntent) -> Self`.
* `.variant(TagVariant) -> Self`.
* `.text(String?) -> Self`.
* `.attributedText(_ attributedText: AttributedString?) -> Self`.
* `.iconImage(Image?) -> Self`.
* `.accessibility(String, String? = nil) -> some View`: first parameter is the accessibility identifier. Second -- is the label identifier. If value is nil and text is set, the label identifier will be the text value. Returns current Tag view.

**Note**: You must use the Modifier to add at least iconImage or/and text.

## Examples
### TagUIView

```swift
let iconImage = UIImage(named: "tag_image") ?? UIImage()

// Tag with both icon and text
let fullTagView = TagUIView(
    theme: self.theme,
    intent: .alert,
    variant: .tinted,
    iconImage: iconImage,
    text: "Tag with text"
)

// Tag with both icon and attributedText
let fullTagView = TagUIView(
    theme: self.theme,
    intent: .alert,
    variant: .tinted,
    iconImage: iconImage,
    attributedText: NSAttributedString(string: "Tag with text")
)

// Tag with icon only
let iconTagView = TagUIView(
    theme: self.theme,
    intent: .danger,
    variant: .filled,
    iconImage: iconImage
)

// Tag with text only
let textTagView = TagUIView(
    theme: self.theme,
    intent: .info,
    variant: .outlined,
    text: "Tag with text only"
)

// Tag with attributedText only
let textTagView = TagUIView(
    theme: self.theme,
    intent: .info,
    variant: .outlined,
    attributedText: NSAttributedString(string: "Tag with text only")
)
```

### TagView

```swift
// Tag with both icon and text
TagView(theme: self.theme)
    .intent(.neutral)
    .variant(.tinted)
    .iconImage(Image("checkbox"))
    .text("Tag with text only")
    .accessibility(identifier: "MyTag0",
                   label: "It's my first tag")

// Tag with both icon and attributedText
TagView(theme: self.theme)
    .intent(.neutral)
    .variant(.tinted)
    .iconImage(Image("checkbox"))
    .attributedText(AttributedString"Tag with text"))
    .accessibility(identifier: "MyTag0",
                   label: "It's my first tag")

// Tag with icon only
TagView(theme: self.theme)
    .intent(.support)
    .variant(.filled)
    .iconImage(Image("checkbox"))
    .accessibility(identifier: "MyTag1",
                   label: "It's my second tag")

// Tag with text only
TagView(theme: self.theme)
    .intent(.success)
    .variant(.outlined)
    .text("It's my third tag")
    .accessibility(identifier: "MyTag2",
                   label: nil)

// Tag with text only
TagView(theme: self.theme)
    .intent(.success)
    .variant(.outlined)
    .attributedText(AttributedString"Tag with text"))
    .accessibility(identifier: "MyTag2",
                   label: nil)
```

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```