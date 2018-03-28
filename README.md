# JSON

JSON Encoder & Decoder for Swift 4.

## Package.swift

```swift
.package(url: "https://github.com/tris-foundation/json.git", .branch("master"))
```

## Performance
`{"message":"Hello, World!"}`<br>

JSONEncoder: 934 644 tasks/sec<br>
Foundation.JSONEncoder: 92 619 tasks/sec<br>

JSONDecoder: 236 062 tasks/sec<br>
Foundation.JSONDecoder: 226 515 tasks/sec<br>
