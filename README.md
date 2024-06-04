# ART BOX

ART BOX is a cutting-edge Flutter application that empowers users to unleash their creativity by generating stunning images using the powerful Monster AI API. With its user-friendly interface and customizable options, this app offers an immersive experience for artists, designers, and anyone seeking to explore the realms of artificial intelligence-generated artwork.

## Introduction

In today's world, where visual storytelling is paramount, ART BOX bridges the gap between imagination and reality. By harnessing the capabilities of Monster AI's advanced text-to-image generation algorithm, users can transform their ideas and prompts into captivating visuals with just a few taps.

Whether you're a professional artist seeking new inspiration, a marketer in need of eye-catching visuals, or simply someone with a passion for creativity, ART BOX caters to your needs. With its intuitive controls and extensive customization options, you can fine-tune every aspect of the image generation process, from styles and aspect ratios to negative prompts and output quantities.

## Features

- Generate high-quality images using the Monster AI API
- Customize image generation with adjustable parameters
- Choose from various styles and aspect ratios
- Set negative prompts to refine image generation
- Download generated images to local storage
- Utilizes a polling method to ensure output generation and retrieval

## Getting Started

### Prerequisites

1. Obtain an API key from the [Monster AI Dashboard](https://monsterapi.ai/user/dashboard).
2. Clone the repository or download the source code.

### Installation

1. Navigate to the project directory:

```
cd art-box
```

2. Install dependencies:

```
flutter pub get
```

3. Update the `apikey.dart` file with your Monster AI API key:

```dart
// apikey.dart
const String aIKey = 'YOUR_API_KEY_HERE';
const String endpoint = 'https://api.monsterapi.ai/v1/generate/txt2img';
```

4. Run the app:

```
flutter run
```

## Implementation Details

The ART BOX app employs a polling method to ensure the successful generation and retrieval of output images from the Monster AI API. This approach involves sending an initial request to the API and then periodically checking the status of the request until the output is ready. Once the output is available, the app retrieves and displays the generated images.

## Dependencies

The ART BOX app utilizes the following dependencies:

- `provider`: For state management
- `http`: For making HTTP requests
- `flutter_file_dialog`: For saving generated images to the local filesystem
- `loading_animation_widget`: For displaying loading animations
- `blur`: For applying blur effects
- `checkout_screen_ui`: For implementing the payment gateway screen

You can find these dependencies in the `pubspec.yaml` file.

## File Structure

- `main.dart`: Entry point of the application
- `providers/artprovider.dart`: Provider class for managing the application state
- `screens/`: Directory containing the main app screens
- `widgets/`: Directory containing reusable UI components
- `utility/`: Directory containing utility functions
- `apikey.dart`: File containing the API key for Monster AI

## Contributing

Contributions to the ART BOX app are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
