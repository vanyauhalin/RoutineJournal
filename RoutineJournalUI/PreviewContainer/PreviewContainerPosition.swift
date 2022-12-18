#if DEBUG
public typealias PreviewContainerPosition = (
  PreviewContainerVPosition,
  PreviewContainerHPosition
)

public enum PreviewContainerVPosition {
  case top
  case bottom
}

public enum PreviewContainerHPosition {
  case leading
  case trailing
}
#endif
