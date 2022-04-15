# Instance Tree Conformation
This is a small library which ensures an instances descendants are of a valid type.
It will also correctly generate the instances type from its shape.

---

## Instance with no children
Any instance in the tree with no children itself can be described simply by its instance name as the value of an object. e.g.,
```
{
  ...
  ExampleChild: "Part"
  ...
}
```

## Instance with children
Instances in the tree which have children must instead be describes as a `Tuple`, with the first element being the 
instance's type, and the second being its descendants.
```
{
  ...
  ExampleChild: ["Part", {
    AnotherChild: "Model"
  }]
  ...
}
```

## Example
Here is an example of a door being described

```
{
  Button: ["MeshPart", {
    Detector: "ClickDetector"
  },
  DoorFrame: ["Model", {
    Top: "Part",
    Columns: ["Folder", {
      Left: "Part",
      Right: "Part"
    }
  },
  SlidingDoor: "Part"
}
```
Returns true

<img src="https://i.imgur.com/m4eTwFt.png" alt="Roblox studio hierarchy showing a valid door instance">

Returns false

<img src="https://i.imgur.com/wdZSw8G.png" alt="Roblox studio hierarchy showing an invalid door instance">