# README

## Assumptions and Limitations
- I intentionally did not include tests, accessibility features, localization, or offline mode in the project.
- I assume that the backend will always provide a valid URL.
- I used AVPlayerViewController wrapped in UIViewControllerRepresentable, but VideoPlayer could have been used instead. However, in real-world scenarios, VideoPlayer (or other SwiftUI views) customization options might not be enough, requiring the use of UIKit components.

## Problems Encountered
- The Mocky service seems to limit mock lifespan to about one day. My first created mock lasted around that time. Additionally, the mock URL provided in the task description is also non-functional. I included the JSON response I used in the `EpisodesNetworkService` file to mitigate this issue. This allows for easy recreation of the mock and quick replacement of the `path` value in the same file if needed.

## Architectural Reasoning
I chose the MVVM+C architecture for the following reasons:
- It promotes better separation of concerns, making the codebase more maintainable.
- It improves scalability by allowing easier expansion of features.
- It integrates well with SwiftUI, ensuring a smooth development experience.
- It simplifies navigation management by using the Coordinator pattern, making flows more modular and reusable.
- It enhances flexibility, allowing different parts of the app to evolve independently.
- It is widely adopted, making it easier to learn and maintain due to the abundance of available resources.
- It enhances testability, making writing unit and UI tests easier.

