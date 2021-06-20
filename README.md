# Availability

A simple if-else widget renderer in an object-oriented way. You can find it similar to Visibility, but with WidgetBuilder usage. With this, the child widget is not put into context until the condition is satisfied.

#code-for-fun

## Getting Started


### Usage:
```dart
Availability(
    available: <condition>,
    childBuilder: (BuildContext context) => <widget>,
)
```

or 

```dart
Availability(
    available: <condition>,
    childBuilder: (BuildContext context) => <widget>,
    elseBuilder: (BuildContext context) => <another_widget>,
)
```

*** Similar dart code without Availability:

```dart
if (<condition>) {
    return <widget>;
} else {
    return <another_widget>;
}
```
